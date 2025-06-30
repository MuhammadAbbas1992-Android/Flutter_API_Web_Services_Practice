import 'package:flutter_api_web_services_practice/models/user_model.dart';
import 'package:get/get.dart';

import '../../models/users_response_model.dart';
import '../repositories/get_list_users_repository/get_list_users_repository.dart';

class GetListUsersController extends GetxController {
  RxBool isLoading = true.obs;
  List<UserModel> userList = [];
  final _api = GetListUsersRepository();
  GetListUsersController() {
    getUserList();
  }

  void getUserList() async {
    await _api.getListUsers().then((value) {
      isLoading.value = false;
      print('ABC... $value');
      Get.snackbar('Success', 'All Data Fetched Successfully');
      userList = UsersResponseModel.fromJson(value).data;
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Get.snackbar('Error', error.toString());
      },
    );
  }
}
