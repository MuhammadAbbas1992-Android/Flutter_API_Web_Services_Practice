import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../custom_widgets/custom_elevated_button_widget.dart';
import '../../../../custom_widgets/custom_text_widget.dart';
import '../../../../view_models/controllers/dashboard_screen_controller.dart';

class HomeDatabaseStreamBuilderWithListViewBuilderView extends StatefulWidget {
  const HomeDatabaseStreamBuilderWithListViewBuilderView({super.key});

  @override
  State<HomeDatabaseStreamBuilderWithListViewBuilderView> createState() =>
      _HomeDatabaseStreamBuilderWithListViewBuilderViewState();
}

class _HomeDatabaseStreamBuilderWithListViewBuilderViewState
    extends State<HomeDatabaseStreamBuilderWithListViewBuilderView> {
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
