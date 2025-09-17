import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

class SplashViewController extends GetxController {
  openDashboardView() {
    Future.delayed(
        Duration(seconds: 3), () => Get.offAllNamed(RoutNames.dashboardView));
  }
}
