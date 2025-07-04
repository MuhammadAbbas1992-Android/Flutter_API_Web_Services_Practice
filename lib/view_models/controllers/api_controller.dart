import 'package:flutter_api_web_services_practice/models/single_user_response_model.dart';
import 'package:flutter_api_web_services_practice/models/user_model.dart';
import 'package:get/get.dart';

import '../../models/users_response_model.dart';
import '../repositories/get_repository/get_repository.dart';

class ApiController extends GetxController {
  RxBool isLoading = false.obs;
  List<UserModel> userList = [];
  UserModel? singleUser;
  final _api = GetRepository();

  ApiController();

  void getUserList() async {
    isLoading.value = true;
    await _api.getListUsersRepository().then((value) {
      isLoading.value = false;
      Get.snackbar('Success', 'All Data Fetched Successfully');
      userList = UsersResponseModel.fromJson(value).data;
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Get.snackbar('Error', error.toString());
      },
    );
  }

  void getSingleUser() async {
    isLoading.value = true;
    await _api.getSingleUserRepository().then((value) {
      isLoading.value = false;
      Get.snackbar('Success', 'Data Fetched Successfully');
      singleUser = SingleUserResponseModel.fromJson(value).data;
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Get.snackbar('Error', error.toString());
      },
    );
  }
}
