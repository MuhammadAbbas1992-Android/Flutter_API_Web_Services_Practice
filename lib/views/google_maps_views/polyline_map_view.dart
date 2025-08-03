import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/polyline_map_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../custom_widgets/custom_text_widget.dart';
import '../../res/constants/app_colors.dart';

class PolylineMapView extends StatefulWidget {
  const PolylineMapView({super.key});

  @override
  State<PolylineMapView> createState() => _PolylineMapViewState();
}

class _PolylineMapViewState extends State<PolylineMapView> {
  late final PolylineMapViewController _polylineMapViewController;

  @override
  void initState() {
    super.initState();
    _polylineMapViewController = Get.put(PolylineMapViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _polylineMapViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'Polyline Map',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: Obx(
          () => _polylineMapViewController.errorMessage.value.isNotEmpty
              ? Container(
                  color: AppColors.lightGrey,
                  child: Center(
                    child: CustomTextWidget(
                      text: _polylineMapViewController.errorMessage.value,
                      color: AppColors.black,
                    ),
                  ),
                )
              : _polylineMapViewController.isPositionLoaded.value == false
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: _polylineMapViewController.currentPosition!,
                            zoom: 14,
                          ),
                          markers: _polylineMapViewController.markers,
                          polylines: _polylineMapViewController.polylines,
                          onMapCreated: (GoogleMapController controller) {
                            _polylineMapViewController.controller
                                .complete(controller);
                          },
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
                                  TextField(
                                    controller: _polylineMapViewController
                                        .latController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: "Enter Latitude"),
                                  ),
                                  TextField(
                                    controller: _polylineMapViewController
                                        .lngController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: "Enter Longitude"),
                                  ),
                                  ElevatedButton(
                                      onPressed: () =>
                                          _polylineMapViewController
                                              .drawPolylineToDestination(),
                                      child: const Text("Draw Polyline")),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        ));
  }
}
