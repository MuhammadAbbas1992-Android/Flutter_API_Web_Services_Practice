import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../res/constants/app_constants.dart';
import '../../../res/routs/rout_names.dart';

class FirebaseIntegrationScreenController extends GetxController {
  void showLoginScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.loginScreen);
  }

  void showSignUpScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.signUpScreen);
  }

  void showSigninEmailLinkScreen(int caseNo) {
    AppConstants.caseNo = caseNo;
    Get.toNamed(RoutNames.signinWithEmailLinkScreen);
  }
}
