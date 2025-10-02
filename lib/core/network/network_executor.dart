import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'network_exceptions.dart';

class NetworkExecutor {
  final http.Client _client;

  NetworkExecutor(this._client);

  Future<dynamic> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = Uri.parse(url).replace(queryParameters: queryParameters);
    _logRequest('GET', uri.toString(), headers: headers);

    return _requestWithRetry(
      () => _client.get(uri, headers: headers),
      'GET',
      uri.toString(),
    );
  }

  Future<dynamic> post(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    _logRequest('POST', url, headers: headers, body: body);

    return _requestWithRetry(
      () => _client.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      ),
      'POST',
      url,
    );
  }

  Future<dynamic> put(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    _logRequest('PUT', url, headers: headers, body: body);

    return _requestWithRetry(
      () => _client.put(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      ),
      'PUT',
      url,
    );
  }

  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    _logRequest('DELETE', url, headers: headers);

    return _requestWithRetry(
      () => _client.delete(Uri.parse(url), headers: headers),
      'DELETE',
      url,
    );
  }

  Future<dynamic> _requestWithRetry(
    Future<http.Response> Function() request,
    String method,
    String url, {
    int retries = 3,
    Duration delay = const Duration(seconds: 1),
  }) async {
    late final dynamic exception;

    for (int i = 0; i < retries; i++) {
      try {
        final response = await request();
        _logResponse(method, url, response);
        return _handleResponse(response);
      } catch (e) {
        exception = e;
        _logError(method, url, e);
        if (e is InternalServerErrorException || e is NetworkException) {
          if (i < retries - 1) {
            await Future.delayed(delay);
            continue;
          }
        }
        rethrow;
      }
    }
    throw exception;
  }

  dynamic _handleResponse(http.Response response) {
    final responseBody = json.decode(response.body) ?? {};
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseBody;
      case 400:
        throw BadRequestException(responseBody['error'] ?? 'Bad request');
      case 401:
        throw UnauthorizedException(responseBody['error'] ?? 'Unauthorized');
      case 404:
        throw NotFoundException(responseBody['error'] ?? 'Not found');
      case 500:
        throw InternalServerErrorException(
          responseBody['error'] ?? 'Internal server error',
        );
      default:
        throw NetworkException(
          'Received invalid status code: ${response.statusCode}',
        );
    }
  }

  void _logRequest(
    String method,
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) {
    if (kDebugMode) {
      final prettyJson = body != null
          ? const JsonEncoder.withIndent('  ').convert(body)
          : "None";

      final logMessage =
          '''
      🌐 REQUEST
      ---------------------------------
      Method: $method
      URL: $url
      Headers: ${headers ?? "None"}
      Body: $prettyJson
      ---------------------------------
      ''';
      developer.log(logMessage, name: 'NetworkExecutor');
    }
  }

  void _logResponse(String method, String url, http.Response response) {
    if (kDebugMode) {
      final prettyJson = const JsonEncoder.withIndent(
        '  ',
      ).convert(json.decode(response.body));

      final logMessage =
          '''
      ✅ RESPONSE
      ---------------------------------
      Method: $method
      URL: $url
      Status Code: ${response.statusCode}
      Headers: ${response.headers}
      Body: $prettyJson
      ---------------------------------
      ''';
      developer.log(logMessage, name: 'NetworkExecutor');
    }
  }

  void _logError(String method, String url, dynamic error) {
    if (kDebugMode) {
      final logMessage =
          '''
      ❌ ERROR
      ---------------------------------
      Method: $method
      URL: $url
      Error: $error
      ---------------------------------
      ''';
      developer.log(
        logMessage,
        name: 'NetworkExecutor',
        error: error is Error ? error : null,
      );
    }
  }
}
