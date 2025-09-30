import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'network_exceptions.dart';

class NetworkExecutor {
  final http.Client _client;

  NetworkExecutor(this._client);

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    _logRequest('GET', url, headers: headers);

    try {
      final response = await _client.get(Uri.parse(url), headers: headers);
      _logResponse('GET', url, response);
      return _handleResponse(response);
    } catch (e) {
      _logError('GET', url, e);
      throw NetworkException('Failed to connect to the server');
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    _logRequest('POST', url, headers: headers, body: body);

    try {
      final response = await _client.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      _logResponse('POST', url, response);
      return _handleResponse(response);
    } catch (e) {
      _logError('POST', url, e);
      throw NetworkException('Failed to connect to the server');
    }
  }

  Future<dynamic> put(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    _logRequest('PUT', url, headers: headers, body: body);

    try {
      final response = await _client.put(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      _logResponse('PUT', url, response);
      return _handleResponse(response);
    } catch (e) {
      _logError('PUT', url, e);
      throw NetworkException('Failed to connect to the server');
    }
  }

  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    _logRequest('DELETE', url, headers: headers);

    try {
      final response = await _client.delete(Uri.parse(url), headers: headers);
      _logResponse('DELETE', url, response);
      return _handleResponse(response);
    } catch (e) {
      _logError('DELETE', url, e);
      throw NetworkException('Failed to connect to the server');
    }
  }

  dynamic _handleResponse(http.Response response) {
    final responseBody = json.decode(response.body);
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
