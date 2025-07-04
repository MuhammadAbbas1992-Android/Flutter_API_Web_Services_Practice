import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  void showGetAllUsersScreen() {
    Get.toNamed(RoutNames.getListUsers);
  }

  void showGetSingleUserScreen() {
    Get.toNamed(RoutNames.getSingleUser);
  }
}
