import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../res/app_utils.dart';
import '../../../../res/routs/rout_names.dart';

class LoginScreenController extends GetxController {
  final emailController =
      TextEditingController(text: 'g.abbas1992developer@gmail.com').obs;
  final passwordController = TextEditingController(text: '123456').obs;

  late FirebaseAuth _auth;
  RxBool isLogining = false.obs;

  LoginScreenController() {
    _auth = FirebaseAuth.instance;
  }

  void loginUser() async {
    isLogining.value = true;
    try {
      // electrohub.page.link
      UserCredential newUser = await _auth.signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      );
      isLogining.value = false;
      if (newUser.user != null) {
        AppUtils.mySnackBar(
          title: 'Response',
          message: 'Login successfully',
        );
        Get.offNamed(RoutNames.welcomeScreen);
        // AppUtils.toggleUserLoginStatus(emailController.value.text);
      }
    } on FirebaseAuthException catch (e) {
      isLogining.value = false;
      String errorMessage = '';

      // Check the error code and set specific messages
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        case 'invalid-credential':
          errorMessage = 'Email id or password not matched.';
          break;
        default:
          errorMessage = 'An unknown error occurred.';
      }

      AppUtils.mySnackBar(
        title: 'Error',
        message: errorMessage,
      );
    }
  }

  Future<void> forgotOrResetPassword() async {
    if (await Get.toNamed(RoutNames.forgotResetPasswordScreen)) {
      AppUtils.mySnackBar(
          title: 'Message',
          message:
              'Password rest Link sent to your provided email address, Please check your email');
    }
  }
}
