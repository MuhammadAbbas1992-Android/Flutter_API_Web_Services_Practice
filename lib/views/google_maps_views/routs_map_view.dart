import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/routs_map_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../custom_widgets/custom_text_widget.dart';

class RoutsMapView extends StatefulWidget {
  const RoutsMapView({super.key});

  @override
  State<RoutsMapView> createState() => _RoutsMapViewState();
}

class _RoutsMapViewState extends State<RoutsMapView> {
  late final RoutsMapViewController _routsMapViewController;

  @override
  void initState() {
    super.initState();
    _routsMapViewController = Get.put(RoutsMapViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _routsMapViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Routs Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _routsMapViewController.isPositionLoaded.value == false
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: _routsMapViewController.currentPosition!,
                          zoom: 14,
                        ),
                        markers: _routsMapViewController.markers,
                        polylines: _routsMapViewController.polylines,
                        onMapCreated: (GoogleMapController controller) {
                          _routsMapViewController.controller
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
                                  controller:
                                      _routsMapViewController.latController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: "Enter Latitude"),
                                ),
                                TextField(
                                  controller:
                                      _routsMapViewController.lngController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: "Enter Longitude"),
                                ),
                                ElevatedButton(
                                    onPressed: () => _routsMapViewController
                                        .searchPointsAndDrawRout(),
                                    child: const Text("Draw Route")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }
}
