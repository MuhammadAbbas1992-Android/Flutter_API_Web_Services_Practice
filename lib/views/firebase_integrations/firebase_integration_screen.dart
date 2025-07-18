import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/firebase_integration_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_integration_screen_controller.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_text_widget.dart';

class FirebaseIntegrationScreen extends StatelessWidget {
  const FirebaseIntegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FirebaseIntegrationScreenController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'Firebase Integration',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                FirebaseIntegrationWidget(
                  caseNo: 1,
                  btnText: 'Login',
                  categoryText: 'Login User',
                  controller: controller,
                ),
                FirebaseIntegrationWidget(
                  caseNo: 2,
                  btnText: 'Sing up',
                  categoryText: 'Sing up user',
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
