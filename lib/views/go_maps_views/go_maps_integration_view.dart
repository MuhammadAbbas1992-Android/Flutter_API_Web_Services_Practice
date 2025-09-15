import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/go_map_widgets/custom_go_maps_button_widget.dart';
import 'package:get/get.dart';

import '../../custom_widgets/other_custom_widgets/custom_text_widget.dart';
import '../../view_models/controllers/go_maps_view_controllers/go_maps_integration_view_controller.dart';

class GoMapsIntegrationView extends StatefulWidget {
  const GoMapsIntegrationView({super.key});

  @override
  State<GoMapsIntegrationView> createState() => _GoMapsIntegrationViewState();
}

class _GoMapsIntegrationViewState extends State<GoMapsIntegrationView> {
  late final GoMapsIntegrationViewController goMapsIntegrationViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goMapsIntegrationViewController =
        Get.put(GoMapsIntegrationViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    goMapsIntegrationViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'Go Maps Integration',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CustomGoMapsButtonWidget(
                  caseNo: 1,
                  btnText: 'Predictions',
                  categoryText: 'Predictions/Search',
                  goMapsIntegrationViewController:
                      goMapsIntegrationViewController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
