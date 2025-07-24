import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:get/get.dart';

import '../../../res/constants/app_constants.dart';
import '../../../res/routs/rout_names.dart';

class FirebaseIntegrationScreenController extends GetxController {
  void showLoginScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.loginScreen);
  }

  void showSignUpScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.signUpScreen);
  }

  void showSigninEmailLinkScreen(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.signinWithEmailLinkScreen);
  }
}
