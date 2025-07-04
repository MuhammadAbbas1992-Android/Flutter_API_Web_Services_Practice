import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  void showGetAllUsersScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getListUsers);
  }

  void showGetSingleUserScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleUser);
  }

  void showGetSingleUserNotFoundScreen() {
    // AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleUser);
  }
}
