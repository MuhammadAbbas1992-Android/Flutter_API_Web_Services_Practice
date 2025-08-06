import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_google_maps_button_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/google_maps_integration_view_controller.dart';
import 'package:get/get.dart';

import '../../custom_widgets/custom_integration_button_widget.dart';
import '../../custom_widgets/rest_api_widget.dart';
import '../../custom_widgets/custom_text_widget.dart';
import '../../res/app_utils.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_fonts.dart';
import '../../view_models/controllers/rest_apis_controllers/get_api_controller.dart';
import '../../view_models/controllers/rest_apis_controllers/post_put_patch_delete_api_controller.dart';
import '../../view_models/controllers/rest_apis_controllers/rest_api_integration_view_controller.dart';

class MapsIntegrationView extends StatefulWidget {
  const MapsIntegrationView({super.key});

  @override
  State<MapsIntegrationView> createState() => _MapsIntegrationViewState();
}

class _MapsIntegrationViewState extends State<MapsIntegrationView> {
  late final MapsIntegrationViewController googleMapsIntegrationViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googleMapsIntegrationViewController =
        Get.put(MapsIntegrationViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    googleMapsIntegrationViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'Google Maps Integration',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CustomGoogleMapsButtonWidget(
                  caseNo: 1,
                  btnText: 'Show Location',
                  categoryText: 'Show Location on Map',
                  googleMapsIntegrationViewController:
                      googleMapsIntegrationViewController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGoogleMapsButtonWidget(
                  caseNo: 2,
                  btnText: 'Share Location',
                  categoryText: 'Share current location',
                  googleMapsIntegrationViewController:
                      googleMapsIntegrationViewController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGoogleMapsButtonWidget(
                  caseNo: 3,
                  btnText: 'Marker',
                  categoryText: 'Marker with Coordinates',
                  googleMapsIntegrationViewController:
                      googleMapsIntegrationViewController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGoogleMapsButtonWidget(
                  caseNo: 4,
                  btnText: 'Marker',
                  categoryText: 'Marker with Address',
                  googleMapsIntegrationViewController:
                      googleMapsIntegrationViewController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGoogleMapsButtonWidget(
                  caseNo: 5,
                  btnText: 'Polyline',
                  categoryText: 'Polyline with Coordinates',
                  googleMapsIntegrationViewController:
                      googleMapsIntegrationViewController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGoogleMapsButtonWidget(
                  caseNo: 6,
                  btnText: 'Polyline',
                  categoryText: 'Polyline with Address',
                  googleMapsIntegrationViewController:
                      googleMapsIntegrationViewController,
                ),
                const SizedBox(
                  height: 10,
                ),
                /*


                CustomGoogleMapsButtonWidget(
                  caseNo: 7,
                  btnText: 'Routs Address Map',
                  categoryText: 'Map with Routs Address',
                  googleMapsIntegrationViewController:
                      googleMapsIntegrationViewController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGoogleMapsButtonWidget(
                  caseNo: 8,
                  btnText: 'Google Map Types',
                  categoryText: 'Types of Google Map',
                  googleMapsIntegrationViewController:
                      googleMapsIntegrationViewController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGoogleMapsButtonWidget(
                  caseNo: 9,
                  btnText: 'Map Marker',
                  categoryText: 'check List',
                  googleMapsIntegrationViewController:
                      googleMapsIntegrationViewController,
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
