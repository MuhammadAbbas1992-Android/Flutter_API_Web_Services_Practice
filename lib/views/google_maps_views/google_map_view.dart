import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/google_map_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../custom_widgets/custom_text_widget.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  late final GoogleMapViewController _googleMapViewController;

  @override
  void initState() {
    super.initState();
    _googleMapViewController = Get.put(GoogleMapViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _googleMapViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Google Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(() => _googleMapViewController.errorMessage.value.isNotEmpty
              ? Container(
                  color: AppColors.lightGrey,
                  child: Center(
                    child: CustomTextWidget(
                      text: _googleMapViewController.errorMessage.value,
                      color: AppColors.black,
                    ),
                  ),
                )
              : _googleMapViewController.isPositionLoaded.value == false
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        GoogleMap(
                          mapType: MapType.hybrid,
                          initialCameraPosition: CameraPosition(
                            target: _googleMapViewController.currentPosition!,
                            zoom: 14,
                          ),
                          markers: _googleMapViewController.markers,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                        ),
                        Positioned(
                          top: 40,
                          left: 10,
                          right: 10,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Latitude",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text("Longitude",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  _googleMapViewController
                                          .isDisplayCoordinates.value
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(_googleMapViewController
                                                .currentPosition!.latitude
                                                .toStringAsFixed(6)),
                                            Text(_googleMapViewController
                                                .currentPosition!.longitude
                                                .toStringAsFixed(6)),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                      onPressed: () => _googleMapViewController
                                          .toggleButton(),
                                      child: const Text("Show Coordinates")),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))),
    );
  }
}
