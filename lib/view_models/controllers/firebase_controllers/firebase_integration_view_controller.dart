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

  void showHomeGridViewBuilderView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeGVBuilderView);
  }

  void showHomeGridViewCountView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeGVCountView);
  }

  void showHomeGridViewExtendView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeGVExtendView);
  }

  void showHomeListViewBuilderView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeLVBuilderView);
  }

  void showHomeListViewSeparatorView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeLVSeparatorView);
  }

  void showHomeListViewCustomView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeLVCustomView);
  }

  void showHomeListViewWithHorizontalView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeLVBuilderWithHorizontalView);
  }

  void showHomeListWheelScrollView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeListWheelScrollView);
  }

  void showHomeReorderableListView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeReorderableListView);
  }

  void showHomeCustomScrollViewAndSlivers(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeCustomScrollViewAndSlivers);
  }

  void showHomePaginatedListView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homePaginatedListView);
  }

  void showHomeStreamBuilderWithGridViewBuilderView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeStreamBuilderGVBView);
  }

  void showHomeStreamBuilderWithListViewBuilderView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeStreamBuilderLVBView);
  }

  void showHomeStreamBuilderWithListViewBuilderSeparatorView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeStreamBuilderLVBSeparatorView);
  }

  void showHomeStreamBuilderWithListViewBuilderCustomView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeStreamBuilderLVBCustomView);
  }

  void showHomeStreamBuilderWithListViewBuilderWithHorizontalView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeStreamBuilderLVBWithHorizontalView);
  }

  void showHomeCloudStreamBuilderWithGridViewBuilderView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeCloudStreamBuilderGVBView);
  }

  void showHomeCloudStreamBuilderWithListViewBuilderView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeCloudStreamBuilderLVBView);
  }

  void showHomeCloudStreamBuilderWithListViewBuilderSeparatorView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeCloudStreamBuilderLVBSeparatorView);
  }

  void showHomeCloudStreamBuilderWithListViewBuilderCustomView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeCloudStreamBuilderLVBCustomView);
  }

  void showHomeCloudStreamBuilderWithListViewBuilderWithHorizontalView(
      int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.homeCloudStreamBuilderLVBWithHorizontalView);
  }

  void showMessagingExampleView(int caseNo) {
    AppUtils.caseNo = caseNo;
    Get.toNamed(RoutNames.messagingExampleView);
  }
}
