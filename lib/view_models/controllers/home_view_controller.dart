import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  void showGetAllDataScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getListScreen);
  }

  void showGetSingleDataScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showGetSingleDataNotFoundScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showGetAllSourceScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getListScreen);
  }

  void showGetSingleSourceScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showGetSingleSourceNotFoundScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showGetDelayedResponseScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }
}
