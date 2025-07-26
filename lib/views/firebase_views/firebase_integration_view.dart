import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_integration_button_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_fonts.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_database_steam_builder_with_list_view_builder_view_controller.dart';
import 'package:get/get.dart';

import '../../custom_widgets/custom_text_widget.dart';
import '../../view_models/controllers/firebase_controllers/firebase_integration_view_controller.dart';

class FirebaseIntegrationView extends StatefulWidget {
  const FirebaseIntegrationView({super.key});

  @override
  State<FirebaseIntegrationView> createState() =>
      _FirebaseIntegrationViewState();
}

class _FirebaseIntegrationViewState extends State<FirebaseIntegrationView> {
  late final FirebaseIntegrationViewController
      firebaseIntegrationScreenController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseIntegrationScreenController =
        Get.put(FirebaseIntegrationViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firebaseIntegrationScreenController.dispose();
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Card(
                  color: AppColors.tinGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const CustomTextWidget(
                          text: 'Firebase Auth',
                          color: AppColors.black,
                          size: 30,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const SizedBox(height: 10),
                        CustomIntegrationButtonWidget(
                          caseNo: 1,
                          btnText: 'Login',
                          categoryText: 'Login User',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 2,
                          btnText: 'Sing up',
                          categoryText: 'Sign up user',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 3,
                          btnText: 'Sign in with email link',
                          categoryText: 'Sign in with email link',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  color: AppColors.tinGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const CustomTextWidget(
                          text: 'Firebase_database',
                          color: AppColors.black,
                          size: 30,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const CustomTextWidget(
                          text: '(Realtime Database as children)',
                          color: AppColors.black,
                          size: 20,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const SizedBox(height: 10),
                        CustomIntegrationButtonWidget(
                          caseNo: 4,
                          btnText: 'Home1',
                          categoryText: 'StreamBuilder by ListView.builder',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 5,
                          btnText: 'Home2',
                          categoryText: 'StreamBuilder by ListView.separated',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 6,
                          btnText: 'Home3',
                          categoryText: 'StreamBuilder by ListView.custom',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 7,
                          btnText: 'Home4',
                          categoryText: 'ListView(Static Data)',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  color: AppColors.tinGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const CustomTextWidget(
                          text: 'Cloud_firestore',
                          color: AppColors.black,
                          size: 30,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const CustomTextWidget(
                          text: '(Cloud Firestore as collection)',
                          color: AppColors.black,
                          size: 20,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const SizedBox(height: 10),
                        CustomIntegrationButtonWidget(
                          caseNo: 1,
                          btnText: 'Login',
                          categoryText: 'Login User',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 2,
                          btnText: 'Sing up',
                          categoryText: 'Sign up user',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 3,
                          btnText: 'Sign in with email link',
                          categoryText: 'Sign in with email link',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
