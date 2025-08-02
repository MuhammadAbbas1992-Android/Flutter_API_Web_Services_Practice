import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:get/get.dart';
import '../../../res/routs/rout_names.dart';

class FirebaseIntegrationViewController extends GetxController {
  void showLoginView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.loginView);
  }

  void showSignUpView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.signUpView);
  }

  void showSigninEmailLinkView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.signinWithEmailLinkView);
  }

  void showHomeStreamBuilderWithListViewBuilderView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeStreamAndListViewBuilderView);
  }
}
