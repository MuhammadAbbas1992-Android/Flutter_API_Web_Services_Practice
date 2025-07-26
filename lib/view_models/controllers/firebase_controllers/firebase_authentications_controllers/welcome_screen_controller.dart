import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:get/get.dart';

import '../../../../res/routs/rout_names.dart';

class WelcomeScreenController extends GetxController {
  void showFirebaseIntegrationScreen() {
    Get.offNamed(RoutNames.firebaseIntegrationView);
  }

  void handleDynamicLink(
      {required BuildContext context, required bool fromColdState}) async {
    final auth = FirebaseAuth.instance;

    final PendingDynamicLinkData? dynamicLinkData;

    if (fromColdState) {
      // 1. Handle app launch from dynamic link (cold start)
      dynamicLinkData = await FirebaseDynamicLinks.instance.getInitialLink();
    } else {
      // 2. Listen for link when app is in background (warm start)
      dynamicLinkData = await FirebaseDynamicLinks.instance.onLink.first;
    }

    if (dynamicLinkData == null) {
      return AppUtils.mySnackBar(
          title: 'Message', message: 'No credentials were founds');
    }

    _handleLinkData(dynamicLinkData, auth);
  }

  void _handleLinkData(PendingDynamicLinkData? data, FirebaseAuth auth) async {
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      print('✅ Deep link received: $deepLink');
      AppUtils.mySnackBar(
          title: 'HandleLinkData', message: '✅ Deep link received: $deepLink');

      const email = 'g.abbas1992developer@gmail.com';

      if (auth.isSignInWithEmailLink(deepLink.toString())) {
        try {
          final UserCredential userCredential = await auth.signInWithEmailLink(
            email: email,
            emailLink: deepLink.toString(),
          );

          AppUtils.mySnackBar(
              title: 'HandleLinkData',
              message: '✅ Signed in as: ${userCredential.user?.email}');
          Get.offNamed(RoutNames.dashboardView);
        } catch (e) {
          AppUtils.mySnackBar(
              title: 'HandleLinkData', message: '❌ Failed to sign in: $e');
        }
      } else {
        AppUtils.mySnackBar(
            title: 'HandleLinkData', message: '❌ Not a valid email link');
      }
    } else {
      AppUtils.mySnackBar(
          title: 'HandleLinkData', message: '⚠️ No deep link found');
    }
  }
}
