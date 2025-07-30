import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/go_maps_view_controllers/go_map_predictions_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/google_map_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../custom_widgets/custom_button_widget.dart';
import '../../../custom_widgets/custom_elevation_button_widget.dart';
import '../../../custom_widgets/custom_header_widget.dart';
import '../../../custom_widgets/custom_image_widget.dart';
import '../../../custom_widgets/custom_name_widget.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_core_controllers/add_image_view_controller.dart';
import '../../common/common_text_form_field_widget.dart';
import '../../res/app_utils.dart';

class GoMapPredictionsView extends StatefulWidget {
  const GoMapPredictionsView({super.key});

  @override
  State<GoMapPredictionsView> createState() => _GoMapPredictionsViewState();
}

class _GoMapPredictionsViewState extends State<GoMapPredictionsView> {
  late final GoMapPredictionsViewController goMapPredictionsViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goMapPredictionsViewController = Get.put(GoMapPredictionsViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    goMapPredictionsViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.back(result: false);
          return true;
        },
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: const Center(
                      child: CustomTextWidget(
                    text: 'Predictions',
                  )),
                  backgroundColor: Colors.blue.shade500,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                          controller: goMapPredictionsViewController
                              .searchTextController.value,
                          onChanged: (value) => goMapPredictionsViewController
                              .getPredictions(value),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: goMapPredictionsViewController
                                .predictionsList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: ListTile(
                                  title: Text(goMapPredictionsViewController
                                      .predictionsList[index]['description']),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
