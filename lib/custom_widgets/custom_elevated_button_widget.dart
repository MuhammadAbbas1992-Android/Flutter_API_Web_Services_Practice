import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/home_screen_controller.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget(
      {super.key, required this.homeScreenController});

  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => homeScreenController.openRestApiIntegrationView(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Background color
        foregroundColor: Colors.white, // Text color
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        "REST API Integration",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
