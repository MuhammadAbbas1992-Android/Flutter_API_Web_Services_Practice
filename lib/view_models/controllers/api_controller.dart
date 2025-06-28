import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/models/users_response_model.dart';
import 'package:flutter_api_web_services_practice/view_models/repositories/get_list_users_repository/get_list_users_repository.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  final _api = GetListUsersRepository();
  void getUserList() {
    _api.getListUsers().then((value) {
      // UsersResponseModel.fromJson(value);
      Get.snackbar('Success', 'All Data Fetched Successfully');
    }).onError(
      (error, stackTrace) {
        Get.snackbar('Error', error.toString());
      },
    );
  }
}
