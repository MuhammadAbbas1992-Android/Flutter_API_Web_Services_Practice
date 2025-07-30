import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

import '../../../res/app_utils.dart';

class GoMapsIntegrationViewController extends GetxController {
  void showGoMapPredictionsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.goMapPredictionsView);
  }
}
