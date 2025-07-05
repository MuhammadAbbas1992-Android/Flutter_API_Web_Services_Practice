import 'package:flutter_api_web_services_practice/models/color_model.dart';
import 'package:flutter_api_web_services_practice/models/colors_response_model.dart';
import 'package:flutter_api_web_services_practice/models/single_color_response_model.dart';
import 'package:flutter_api_web_services_practice/models/single_user_response_model.dart';
import 'package:flutter_api_web_services_practice/models/user_model.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../models/users_response_model.dart';
import '../repositories/get_repository/get_repository.dart';

class ApiController extends GetxController {
  RxBool isLoading = false.obs;
  List<UserModel> userList = [];
  List<ColorModel> colorList = [];
  UserModel? singleUser;
  ColorModel? singleColor;
  final _api = GetRepository();

  ApiController();

  void getAllList() async {
    userList = [];
    colorList = [];
    isLoading.value = true;
    await _api.getListScreenRepository().then((value) {
      isLoading.value = false;

      switch (AppConstants.caseNo) {
        case 1:
          userList = UsersResponseModel.fromJson(value).data;
          break;
        case 4:
          colorList = ColorsResponseModel.fromJson(value).data;
          break;
      }

      Get.snackbar('Success', 'All Data Fetched Successfully');
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Get.snackbar('Error', error.toString());
      },
    );
  }

  void getSingleModel() async {
    singleUser = null;
    singleColor = null;
    isLoading.value = true;
    await _api.getSingleScreenRepository().then((value) {
      isLoading.value = false;
      switch (AppConstants.caseNo) {
        case 2:
          singleUser = SingleUserResponseModel.fromJson(value).data;
          break;
        case 3:
          singleUser = SingleUserResponseModel.fromJson(value).data;
          break;
        case 5:
          singleColor = SingleColorResponseModel.fromJson(value).data;
          break;
        case 6:
          singleColor = SingleColorResponseModel.fromJson(value).data;
          break;
        case 7:
          singleUser = SingleUserResponseModel.fromJson(value).data;
          break;
      }
      Get.snackbar('Success', 'Data Fetched Successfully');
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Get.snackbar('Error', error.toString());
      },
    );
  }
}
