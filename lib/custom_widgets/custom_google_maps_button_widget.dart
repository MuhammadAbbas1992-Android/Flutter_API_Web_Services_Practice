import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_database_steam_builder_with_list_view_builder_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/google_maps_integration_view_controller.dart';
import '../view_models/controllers/firebase_controllers/firebase_integration_view_controller.dart';
import 'custom_text_widget.dart';

class CustomGoogleMapsButtonWidget extends StatelessWidget {
  const CustomGoogleMapsButtonWidget({
    super.key,
    required this.caseNo,
    required this.btnText,
    required this.categoryText,
    this.googleMapsIntegrationViewController,
  });

  final int caseNo;
  final String btnText;
  final String categoryText;
  final GoogleMapsIntegrationViewController?
      googleMapsIntegrationViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              switch (caseNo) {
                case 1:
                  googleMapsIntegrationViewController?.showMapScreen(caseNo);
                  break;
                case 2:
                  googleMapsIntegrationViewController
                      ?.showMapWithPolylineScreen(caseNo);
                  break;
                case 3:
                  googleMapsIntegrationViewController
                      ?.showMapWithPolylineAddressScreen(caseNo);
                  break;
                case 4:
                  googleMapsIntegrationViewController
                      ?.showMapWithRoutsScreen(caseNo);
                  break;
                case 5:
                  googleMapsIntegrationViewController
                      ?.showShareLocationScreen(caseNo);
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
