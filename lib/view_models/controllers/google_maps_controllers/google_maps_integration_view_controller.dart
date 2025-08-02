import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

import '../../../res/app_utils.dart';

class GoogleMapsIntegrationViewController extends GetxController {
  void showMapTypesScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.googleMapTypesView);
  }

  void showMapScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.googleMapView);
  }

  void showMapWithPolylineScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.polylineMapView);
  }

  void showMapWithPolylineAddressScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.polylineMapAddressView);
  }

  void showMapWithRoutsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.routsMapView);
  }

  void showShareLocationScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.shareCurrentLocationView);
  }
}
