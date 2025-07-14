import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_elevated_button_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/home_screen_controller.dart';
import 'package:get/get.dart';

import '../custom_widgets/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.put(HomeScreenController());
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Center(
                  child: CustomTextWidget(
                text: 'APIs Integration',
              )),
              backgroundColor: Colors.blue.shade500,
            ),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomElevatedButtonWidget(
                            homeScreenController: homeScreenController,
                          )
                        ])))));
  }
}
