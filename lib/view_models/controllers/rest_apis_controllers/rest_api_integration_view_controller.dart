import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

import '../../../res/app_utils.dart';

class RestApiIntegrationViewController extends GetxController {
  void showGetAllDataScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getListView);
  }

  void showGetSingleDataScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleView);
  }

  void showGetSingleDataNotFoundScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleView);
  }

  void showGetAllSourceScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getListView);
  }

  void showGetSingleSourceScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleView);
  }

  void showGetSingleSourceNotFoundScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleView);
  }

  void showGetDelayedResponseScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleView);
  }

  void showGetListAllObjectsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getListView);
  }

  void showGetListObjectsByIdsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getListView);
  }

  void showGetSingleObjectByIdScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.getSingleView);
  }

  void showPostSingleObjectScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.postPutPatchDeleteSingleView);
  }

  void showPutSingleObjectScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.postPutPatchDeleteSingleView);
  }

  void showPatchSingleObjectScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.postPutPatchDeleteSingleView);
  }

  void showDeleteSingleObjectScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.postPutPatchDeleteSingleView);
  }
}
