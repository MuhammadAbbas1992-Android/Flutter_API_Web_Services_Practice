import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_api_web_services_practice/data/exceptions/app_exceptions.dart';

import 'package:flutter_api_web_services_practice/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getListScreenApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJSON;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJSON = returnResponse(response);
    } on InternetException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }
    return responseJSON;
  }

  @override
  Future<dynamic> getSingleScreenApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJSON;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJSON = returnResponse(response);
    } on InternetException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }
    return responseJSON;
  }

  @override
  Future<dynamic> postSingleScreenApi(String url, Map<String, String> header,
      Map<String, dynamic> requestBody) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJSON;

    try {
      final response = await http
          .post(Uri.parse(url), headers: header, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 10));

      responseJSON = returnResponse(response);
    } on InternetException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }
    return responseJSON;
  }

  @override
  Future<dynamic> putSingleScreenApi(String url, Map<String, String> header,
      Map<String, dynamic> requestBody) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJSON;

    try {
      final response = await http
          .put(Uri.parse(url), headers: header, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 10));

      responseJSON = returnResponse(response);
    } on InternetException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }
    return responseJSON;
  }

  @override
  Future<dynamic> patchSingleScreenApi(String url, Map<String, String> header,
      Map<String, dynamic> requestBody) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJSON;

    try {
      final response = await http
          .patch(Uri.parse(url), headers: header, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 10));

      responseJSON = returnResponse(response);
    } on InternetException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }
    return responseJSON;
  }

  @override
  Future<dynamic> deleteSingleScreenApi(String url, Map<String, String>? header,
      Map<String, dynamic>? requestBody) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJSON;

    try {
      final response = await http
          .delete(Uri.parse(url),
              headers: header, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 10));

      responseJSON = returnResponse(response);
    } on InternetException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }
    return responseJSON;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        print('${response.statusCode}');
        dynamic responseJson = jsonDecode(response.body);
        // debugPrint('ABC Success: $responseJson');
        // debugPrint('ABC Response: ${response.body}');
        return responseJson;
      case 404:
        print('${response.statusCode}');
        dynamic responseJson = jsonDecode(response.body);
        // debugPrint('ABC Error: $responseJson');
        // debugPrint('ABC Error: ${response.body}');
        return responseJson;
      case 400:
        print('${response.statusCode}');
        throw FetchDataException('No user data found ${response.statusCode}');
      case 401:
        print('${response.statusCode}');
        throw FetchDataException('Missing API key ${response.statusCode}');
      default:
        print('${response.statusCode}');
        throw RequestTimeOutException(
            'Error occurred while communicating server ${response.statusCode}');
    }
  }
}
