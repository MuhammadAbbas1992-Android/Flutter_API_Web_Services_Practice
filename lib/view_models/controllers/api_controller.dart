import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/models/users_response_model.dart';
import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:flutter_api_web_services_practice/view_models/repositories/get_list_users_repository/get_list_users_repository.dart';
import 'package:flutter_api_web_services_practice/views/get_list_users.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  void showGetAllUsersScreen() {
    Get.toNamed(RoutNames.getListUsers);
  }
}
