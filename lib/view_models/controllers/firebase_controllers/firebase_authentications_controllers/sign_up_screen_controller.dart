import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../res/app_utils.dart';
import '../../../../res/routs/rout_names.dart';

class SignUpScreenController extends GetxController {
  final emailController = TextEditingController(text: 'admin123@gmail.com').obs;
  final passwordController = TextEditingController(text: '123456').obs;
  final confirmPasswordController = TextEditingController(text: '123456').obs;

  late FirebaseAuth _auth;
  RxBool isSigning = false.obs;

  SignUpScreenController() {
    // print('yes called SignUpController Constructor');
    _auth = FirebaseAuth.instance;
  }

  void signUpUser() async {
    isSigning.value = true;
    try {
      UserCredential newUser = await _auth.createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text);

      isSigning.value = false;
      if (newUser.user != null) {
        AppUtils.mySnackBar(
            title: 'Response', message: 'New user created successfully');
        Get.offNamed(RoutNames.welcomeView);
      } else {
        AppUtils.mySnackBar(
            title: 'Response', message: 'Error occurred for creating new user');
      }
    } on FirebaseAuthException catch (e) {
      isSigning.value = false;
      String errorMessage = '';

      // Check the error code and set specific messages
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already in use by another account.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'operation-not-allowed':
          errorMessage =
              'Email/password accounts are not enabled. Enable them in the Firebase Console.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
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
}
