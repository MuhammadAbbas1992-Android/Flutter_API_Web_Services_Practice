import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_api_web_services_practice/data/exceptions/app_exceptions.dart';

import 'package:flutter_api_web_services_practice/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getListUsersApi(String url) async {
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
  Future<dynamic> getSingleUserApi(String url) async {
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
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException;
      default:
        throw FetchDataException(
            'Error occurred while communicating server ${response.statusCode}');
    }
  }
}
