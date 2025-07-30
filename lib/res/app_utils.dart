import 'package:get/get.dart';

import '../models/picture_model.dart';

class AppUtils {
  static int caseNo = 1;
  //Ids It will be updated on RunTime
  static String objectId = '';

  static List<PictureModel> picturesList = <PictureModel>[];

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter email';
    } else {
      email = email.trim();
      final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$",
      );

      return emailRegex.hasMatch(email) ? null : "Please enter a valid email";
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Requires at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateFieldData(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter any text';
    }
    return null;
  }

  static String? validateDropDownItem(String value, String choice) {
    if (value == choice) {
      return 'Please select an item from dropdown ';
    }
    return null;
  }

  static void mySnackBar({required String title, required String message}) {
    Get.snackbar(title, message);
  }
}
