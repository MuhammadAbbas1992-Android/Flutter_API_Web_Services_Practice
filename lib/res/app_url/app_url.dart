import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';

class AppUrl {
  //APis
  static const String baseUrl = 'https://reqres.in';
  static const String baseApi = 'https://api.restful-api.dev';
  static const String getListUsersApi = '$baseUrl/api/users?page=2';
  static const String getSingleApi = '$baseUrl/api/users/2';
  static const String getSingleDataNotFoundApi = '$baseUrl/api/users/23';
  static const String getListResourceApi = '$baseUrl/api/unknown';
  static const String getSingleResourceApi = '$baseUrl/api/unknown/2';
  static const String getSingleResourceNotFoundApi = '$baseUrl/api/unknown/23';
  static const String getDelayedResponseApi = '$baseUrl/api/users?delay=3';
  static const String getListAllObjectsApi = '$baseApi/objects';
  static const String getListObjectsByIdsApi =
      '$baseApi/objects?id=3&id=5&id=11';
  static const String getSingleObjectByIdApi = '$baseApi/objects/7';
  static const String postSingleObject = '$baseApi/objects';
  static String putSingleObject = '$baseApi/objects/${AppUtils.objectId}';
  static String patchSingleObject = '$baseApi/objects/${AppUtils.objectId}';
  static String deleteSingleObject = '$baseApi/objects/${AppUtils.objectId}';
  //Headers
  static const Map<String, String> header = {
    'Content-Type': 'application/json',
  };
}
