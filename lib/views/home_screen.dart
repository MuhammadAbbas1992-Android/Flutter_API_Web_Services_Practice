import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_elevated_button_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/home_screen_controller.dart';
import 'package:get/get.dart';

import '../custom_widgets/custom_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenController homeScreenController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeScreenController = Get.put(HomeScreenController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    homeScreenController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomElevatedButtonWidget(
                            btnText: 'REST API Integration',
                            integrationType: 1,
                            homeScreenController: homeScreenController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedButtonWidget(
                            btnText: 'Firebase Integration',
                            integrationType: 2,
                            homeScreenController: homeScreenController,
                          )
                        ])))));
  }
}
