import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

class DashboardScreenController extends GetxController {
  openRestApiIntegrationView() {
    Get.toNamed(RoutNames.restApiIntegrationScreen);
  }

  openFirebaseIntegrationView() {
    Get.toNamed(RoutNames.firebaseIntegrationScreen);
  }
}
