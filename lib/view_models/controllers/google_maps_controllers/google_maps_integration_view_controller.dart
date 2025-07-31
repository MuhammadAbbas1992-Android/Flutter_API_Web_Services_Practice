import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

import '../../../res/app_utils.dart';

class GoogleMapsIntegrationViewController extends GetxController {
  void showMapPredictionsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.googleMapView);
  }

  void showMapScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.googleMapView);
  }

  void showMapWithPolylineScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.googleMapWithPolylineView);
  }

  void showMapWithPolylineAddressScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.googleMapWithPolylineAddressView);
  }

  void showMapWithRoutsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.googleMapWithRoutsView);
  }
}
