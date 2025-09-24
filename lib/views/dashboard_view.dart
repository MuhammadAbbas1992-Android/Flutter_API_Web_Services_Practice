import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/dashboard_view_controller.dart';
import 'package:get/get.dart';

import '../custom_widgets/other_custom_widgets/custom_elevated_button_widget.dart';
import '../custom_widgets/other_custom_widgets/custom_text_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late final DashboardViewController homeScreenController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeScreenController = Get.put(DashboardViewController());
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
                            dashboardViewController: homeScreenController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedButtonWidget(
                            btnText: 'Firebase Integration',
                            integrationType: 2,
                            dashboardViewController: homeScreenController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedButtonWidget(
                            btnText: 'Google Maps',
                            integrationType: 3,
                            dashboardViewController: homeScreenController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedButtonWidget(
                            btnText: 'Go Maps',
                            integrationType: 4,
                            dashboardViewController: homeScreenController,
                          ),
                        ])))));
  }
}
