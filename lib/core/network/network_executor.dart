import 'dart:convert';

import 'package:http/http.dart' as http;

import 'network_exceptions.dart';

class NetworkExecutor {
  final http.Client _client;

  NetworkExecutor(this._client);

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await _client.get(Uri.parse(url), headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw NetworkException('Failed to connect to the server');
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw NetworkException('Failed to connect to the server');
    }
  }

  Future<dynamic> put(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      final response = await _client.put(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw NetworkException('Failed to connect to the server');
    }
  }

  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    try {
      final response = await _client.delete(Uri.parse(url), headers: headers);
      return _handleResponse(response);
    } catch (e) {
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
}
