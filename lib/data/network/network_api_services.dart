import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        print('${response.statusCode}');
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        print('${response.statusCode}');
        throw FetchDataException('No user data found ${response.statusCode}');
      case 401:
        print('${response.statusCode}');
        throw FetchDataException('Missing API key ${response.statusCode}');
      case 404:
        print('${response.statusCode}');
        throw InvalidUrlException(
            'The requested URL or resource was not found ${response.statusCode}');
      default:
        print('${response.statusCode}');
        throw RequestTimeOutException(
            'Error occurred while communicating server ${response.statusCode}');
    }
  }
}
