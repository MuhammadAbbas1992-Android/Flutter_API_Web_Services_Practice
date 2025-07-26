import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

class DashboardViewController extends GetxController {
  openRestApiIntegrationView() {
    Get.toNamed(RoutNames.restApiIntegrationView);
  }

  openFirebaseIntegrationView() {
    Get.toNamed(RoutNames.firebaseIntegrationView);
  }
}
