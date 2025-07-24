import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../custom_widgets/custom_elevated_button_widget.dart';
import '../../../../custom_widgets/custom_text_widget.dart';
import '../../../../view_models/controllers/dashboard_screen_controller.dart';

class HomeDatabaseSteamBuilderWithListViewBuilderScreen extends StatefulWidget {
  const HomeDatabaseSteamBuilderWithListViewBuilderScreen({super.key});

  @override
  State<HomeDatabaseSteamBuilderWithListViewBuilderScreen> createState() =>
      _HomeDatabaseSteamBuilderWithListViewBuilderScreenState();
}

class _HomeDatabaseSteamBuilderWithListViewBuilderScreenState
    extends State<HomeDatabaseSteamBuilderWithListViewBuilderScreen> {
  late final DashboardScreenController homeScreenController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeScreenController = Get.put(DashboardScreenController());
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
