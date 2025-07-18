import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/home_screen_controller.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget(
      {super.key,
      required this.homeScreenController,
      required this.btnText,
      required this.integrationType});

  final int integrationType;
  final String btnText;
  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        switch (integrationType) {
          case 1:
            homeScreenController.openRestApiIntegrationView();
            break;
          case 2:
            homeScreenController.openFirebaseIntegrationView();
            break;
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Background color
        foregroundColor: Colors.white, // Text color
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
