import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/app_utils.dart';

class SigninWithEmailLinkScreenController extends GetxController {
  final emailController =
      TextEditingController(text: 'g.abbas1992developer@gmail.com').obs;

  late FirebaseAuth _auth;
  RxBool isLogining = false.obs;

  SigninWithEmailLinkScreenController() {
    _auth = FirebaseAuth.instance;
  }

  void sendEmailLink() async {
    isLogining.value = true;
    ActionCodeSettings acs = ActionCodeSettings(
      url:
          'https://electrohub.page.link/sign-in', // must be in Firebase Console
      handleCodeInApp: true,
      androidPackageName: 'com.example.flutter_api_web_services_practice',
      androidInstallApp: true,
      androidMinimumVersion: '21',
      iOSBundleId: 'com.example.flutter_api_web_services_practice',
    );

    try {
      await _auth.sendSignInLinkToEmail(
        email: emailController.value.text,
        actionCodeSettings: acs,
      );

      isLogining.value = false;
      AppUtils.mySnackBar(title: 'Message', message: 'Link sent to your email');
    } catch (e) {
      isLogining.value = false;
      AppUtils.mySnackBar(title: 'Error', message: 'sending sign-in link: $e');
    }
  }
}
