import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/go_maps_view_controllers/go_maps_integration_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/google_maps_integration_view_controller.dart';
import '../view_models/controllers/firebase_controllers/firebase_integration_view_controller.dart';
import 'custom_text_widget.dart';

class CustomGoMapsButtonWidget extends StatelessWidget {
  const CustomGoMapsButtonWidget({
    super.key,
    required this.caseNo,
    required this.btnText,
    required this.categoryText,
    this.goMapsIntegrationViewController,
  });

  final int caseNo;
  final String btnText;
  final String categoryText;
  final GoMapsIntegrationViewController? goMapsIntegrationViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              switch (caseNo) {
                //GoMaps Predictions
                case 1:
                  goMapsIntegrationViewController
                      ?.showGoMapPredictionsScreen(caseNo);
                  break;
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: CustomTextWidget(text: btnText)),
        CustomTextWidget(
          text: categoryText,
          color: Colors.black,
        ),
      ],
    );
  }
}
