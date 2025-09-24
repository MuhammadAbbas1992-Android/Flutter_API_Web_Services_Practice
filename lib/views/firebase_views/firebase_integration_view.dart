import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/other_custom_widgets/custom_integration_button_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_fonts.dart';
import 'package:get/get.dart';

import '../../custom_widgets/other_custom_widgets/custom_text_widget.dart';
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
          iconTheme: IconThemeData(color: AppColors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Card(
                  color: AppColors.tinGrey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: Column(
                      children: [
                        const CustomTextWidget(
                          text: 'Firebase Messaging',
                          color: AppColors.black,
                          size: 30,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const CustomTextWidget(
                          text: '(Firebase Notification\nMessages',
                          textAlign: TextAlign.center,
                          color: AppColors.black,
                          size: 20,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const SizedBox(height: 10),
                        CustomIntegrationButtonWidget(
                          caseNo: 25,
                          btnText: 'Home1',
                          categoryText: 'Notification Example',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: Column(
                      children: [
                        const CustomTextWidget(
                          text: 'Data Views Types',
                          color: AppColors.black,
                          size: 30,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const CustomTextWidget(
                          text: '(Realtime Database \nas children)',
                          textAlign: TextAlign.center,
                          color: AppColors.black,
                          size: 20,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const SizedBox(height: 10),
                        CustomIntegrationButtonWidget(
                          caseNo: 4,
                          btnText: 'Home1',
                          categoryText: 'GridView.builder(Dynamic Col)',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 5,
                          btnText: 'Home2',
                          categoryText: 'GridView.count(Fixed Col)',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 6,
                          btnText: 'Home3',
                          categoryText: 'GridView.extend(Fixed Width)',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 7,
                          btnText: 'Home4',
                          categoryText: 'ListView.builder',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 8,
                          btnText: 'Home5',
                          categoryText: 'ListView.separator',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 9,
                          btnText: 'Home6',
                          categoryText: 'ListView.custom',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 10,
                          btnText: 'Home7',
                          categoryText: 'ListView.builder (Horizontal)',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 11,
                          btnText: 'Home8',
                          categoryText: 'ListWheelScrollView',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 12,
                          btnText: 'Home9',
                          categoryText: 'ReorderableListView',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 13,
                          btnText: 'Home10',
                          categoryText: 'CustomScrollView + Slivers',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 14,
                          btnText: 'Home11',
                          categoryText: 'PaginatedListView',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: Column(
                      children: [
                        const CustomTextWidget(
                          text: 'Firebase_database',
                          color: AppColors.black,
                          size: 30,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const CustomTextWidget(
                          text:
                              '(Realtime Database \nas children)\n using StreamBuilder',
                          textAlign: TextAlign.center,
                          color: AppColors.black,
                          size: 20,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const SizedBox(height: 10),
                        CustomIntegrationButtonWidget(
                          caseNo: 15,
                          btnText: 'Home1',
                          categoryText: 'GridView.builder',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 16,
                          btnText: 'Home2',
                          categoryText: ''
                              'ListView.builder',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 17,
                          btnText: 'Home3',
                          categoryText: 'ListView.separator',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 18,
                          btnText: 'Home4',
                          categoryText: 'ListView.custom',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 19,
                          btnText: 'Home5',
                          categoryText: 'ListView.builder(H)',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: Column(
                      children: [
                        const CustomTextWidget(
                          text: 'Cloud_firestore',
                          color: AppColors.black,
                          size: 30,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const CustomTextWidget(
                          text:
                              '(Cloud Firestore \nas collection)\nusing StreamBuilder',
                          textAlign: TextAlign.center,
                          color: AppColors.black,
                          size: 20,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                        const SizedBox(height: 10),
                        CustomIntegrationButtonWidget(
                          caseNo: 20,
                          btnText: 'Home1',
                          categoryText: 'GridView.builder',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 21,
                          btnText: 'Home2',
                          categoryText: 'ListView.builder',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 22,
                          btnText: 'Home3',
                          categoryText: 'ListView.separator',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 23,
                          btnText: 'Home4',
                          categoryText: 'ListView.custom',
                          firebaseIntegrationViewController:
                              firebaseIntegrationScreenController,
                        ),
                        CustomIntegrationButtonWidget(
                          caseNo: 24,
                          btnText: 'Home5',
                          categoryText: 'ListView.builder(H)',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
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
                          btnText: 'Sign in',
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
