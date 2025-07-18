import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_integration_screen_controller.dart';

import 'custom_text_widget.dart';

class FirebaseIntegrationWidget extends StatelessWidget {
  const FirebaseIntegrationWidget({
    super.key,
    required this.caseNo,
    required this.btnText,
    required this.categoryText,
    this.controller,
  });

  final int caseNo;
  final String btnText;
  final String categoryText;
  final FirebaseIntegrationScreenController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              switch (caseNo) {
                //Firebase User Authentication
                case 1:
                  controller?.showLoginScreen(caseNo);
                  break;
                case 2:
                  controller?.showSignUpScreen(caseNo);
                  break;
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: CustomTextWidget(text: btnText)),
        CustomTextWidget(
          text: categoryText,
          color: Colors.black,
        ),
      ],
    );
  }
}
