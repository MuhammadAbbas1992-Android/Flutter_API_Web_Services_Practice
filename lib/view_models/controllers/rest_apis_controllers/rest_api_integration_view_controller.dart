import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

import '../../../res/app_utils.dart';

class RestApiIntegrationViewController extends GetxController {
  void showGetAllDataScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getListScreen);
  }

  void showGetSingleDataScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showGetSingleDataNotFoundScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showGetAllSourceScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getListScreen);
  }

  void showGetSingleSourceScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showGetSingleSourceNotFoundScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showGetDelayedResponseScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showGetListAllObjectsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getListScreen);
  }

  void showGetListObjectsByIdsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getListScreen);
  }

  void showGetSingleObjectByIdScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleScreen);
  }

  void showPostSingleObjectScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.postPutPatchDeleteSingleScreen);
  }

  void showPutSingleObjectScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.postPutPatchDeleteSingleScreen);
  }

  void showPatchSingleObjectScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.postPutPatchDeleteSingleScreen);
  }

  void showDeleteSingleObjectScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.postPutPatchDeleteSingleScreen);
  }
}
