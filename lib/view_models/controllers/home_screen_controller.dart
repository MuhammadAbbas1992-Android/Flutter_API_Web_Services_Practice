import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  openRestApiIntegrationView() {
    Get.toNamed(RoutNames.restApiIntegrationScreen);
  }

  openFirebaseIntegrationView() {
    Get.toNamed(RoutNames.firebaseIntegrationScreen);
  }
}
