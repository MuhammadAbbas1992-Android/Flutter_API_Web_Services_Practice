import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/google_maps_integration_view_controller.dart';
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
  final MapsIntegrationViewController? googleMapsIntegrationViewController;

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
                      ?.showShareLocationScreen(caseNo);
                  break;
                case 3:
                  googleMapsIntegrationViewController
                      ?.showCoordinatesMarkerScreen(caseNo);
                  break;
                case 4:
                  googleMapsIntegrationViewController
                      ?.showAddressMarkerScreen(caseNo);
                  break;
                case 5:
                  googleMapsIntegrationViewController
                      ?.showCoordinatesPolylineScreen(caseNo);
                  break;
                case 6:
                  googleMapsIntegrationViewController
                      ?.showAddressPolylineScreen(caseNo);
                  break;
                case 7:
                  googleMapsIntegrationViewController
                      ?.showCoordinatesRoutsScreen(caseNo);
                  break;
                case 8:
                  googleMapsIntegrationViewController
                      ?.showAddressRoutsScreen(caseNo);
                  break;
                case 9:
                  googleMapsIntegrationViewController
                      ?.showCoordinatesPolygonScreen(caseNo);
                  break;
                case 10:
                  googleMapsIntegrationViewController
                      ?.showAddressPolygonScreen(caseNo);
                  break;
                case 11:
                  googleMapsIntegrationViewController
                      ?.showCoordinatesCircleScreen(caseNo);
                  break;
                case 12:
                  googleMapsIntegrationViewController
                      ?.showAddressCircleScreen(caseNo);
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
