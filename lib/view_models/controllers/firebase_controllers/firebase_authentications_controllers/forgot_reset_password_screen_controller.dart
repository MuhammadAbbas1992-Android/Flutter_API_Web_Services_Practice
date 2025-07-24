import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../res/app_utils.dart';

class ForgotResetPasswordScreenController extends GetxController {
  final emailController =
      TextEditingController(text: 'g.abbas1992developer@gmail.com').obs;

  late FirebaseAuth _auth;
  RxBool isLogining = false.obs;

  ForgotResetPasswordScreenController() {
    _auth = FirebaseAuth.instance;
  }

  void sendEmailLink() async {
    isLogining.value = true;

    try {
      await _auth.sendPasswordResetEmail(email: emailController.value.text);
      isLogining.value = false;
      Get.back(result: true);
    } catch (e) {
      isLogining.value = false;
      AppUtils.mySnackBar(title: 'Error', message: 'sending reset link: $e');
    }
  }
}
