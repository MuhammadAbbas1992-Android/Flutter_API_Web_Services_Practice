import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

import '../../../res/app_utils.dart';

class MapsIntegrationViewController extends GetxController {
  void showMapScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.currentLocationView);
  }

  void showShareLocationScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.shareCurrentLocationView);
  }

  void showCoordinatesMarkerScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.coordinatesMarkerView);
  }

  void showAddressMarkerScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.addressMarkerView);
  }

  void showCoordinatesPolylineScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.coordinatesPolylineView);
  }

  void showAddressPolylineScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.addressPolylineView);
  }

  void showCoordinatesRoutsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.coordinatesRoutsView);
  }

  void showAddressRoutsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.addressRoutsView);
  }

  void showCoordinatesPolygonScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.coordinatesPolygonView);
  }

  /*

  void showMapWithPolylineAddressScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.polylineMapAddressView);
  }

  void showMapWithRoutsScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.routsMapView);
  }

  void showMapWithRoutsAddressScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.routsMapAddressView);
  }

  void showMapTypesScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.googleMapTypesView);
  }

  void showMapMarkersScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.mapMarkerView);
  }*/
}
