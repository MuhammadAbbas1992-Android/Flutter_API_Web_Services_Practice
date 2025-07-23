import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/firebase_integration_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_fonts.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_integration_screen_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/login_screen_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/sign_up_screen_controller.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_text_widget.dart';

class FirebaseIntegrationScreen extends StatefulWidget {
  const FirebaseIntegrationScreen({super.key});

  @override
  State<FirebaseIntegrationScreen> createState() =>
      _FirebaseIntegrationScreenState();
}

class _FirebaseIntegrationScreenState extends State<FirebaseIntegrationScreen> {
  late final FirebaseIntegrationScreenController
      firebaseIntegrationScreenController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseIntegrationScreenController =
        Get.put(FirebaseIntegrationScreenController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firebaseIntegrationScreenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Card(
              color: AppColors.tinGrey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const CustomTextWidget(
                      text: 'Firebase Auth',
                      color: AppColors.pink,
                      size: 30,
                      fontFamily: AppFonts.poppinsBold,
                    ),
                    const SizedBox(height: 10),
                    FirebaseIntegrationWidget(
                      caseNo: 1,
                      btnText: 'Login',
                      categoryText: 'Login User',
                      controller: firebaseIntegrationScreenController,
                    ),
                    FirebaseIntegrationWidget(
                      caseNo: 2,
                      btnText: 'Sing up',
                      categoryText: 'Sing up user',
                      controller: firebaseIntegrationScreenController,
                    ),
                    FirebaseIntegrationWidget(
                      caseNo: 3,
                      btnText: 'Sing in with email link',
                      categoryText: 'Sing in with email link',
                      controller: firebaseIntegrationScreenController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
