import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/polylines_controllers/coordinates_polyline_view_controller.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoordinatesPolylineView extends StatefulWidget {
  const CoordinatesPolylineView({super.key});

  @override
  State<CoordinatesPolylineView> createState() =>
      _CoordinatesPolylineViewState();
}

class _CoordinatesPolylineViewState extends State<CoordinatesPolylineView> {
  late final CoordinatesPolylineViewController
      _coordinatesPolylineViewController;

  @override
  void initState() {
    super.initState();
    _coordinatesPolylineViewController =
        Get.put(CoordinatesPolylineViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _coordinatesPolylineViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Coordinates Polyline Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _coordinatesPolylineViewController
                    .errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text: _coordinatesPolylineViewController
                            .errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _coordinatesPolylineViewController.isPositionLoaded.value ==
                        false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.satellite,
                            initialCameraPosition: CameraPosition(
                              target: _coordinatesPolylineViewController
                                  .currentPosition!,
                              zoom: 14,
                            ),
                            markers: _coordinatesPolylineViewController.markers,
                            polylines:
                                _coordinatesPolylineViewController.polylines,
                            onMapCreated: (GoogleMapController controller) {
                              _coordinatesPolylineViewController.controller
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
                                          _coordinatesPolylineViewController
                                              .latController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: "Enter Latitude"),
                                    ),
                                    TextField(
                                      controller:
                                          _coordinatesPolylineViewController
                                              .lngController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: "Enter Longitude"),
                                    ),
                                    const SizedBox(height: 5),
                                    _coordinatesPolylineViewController
                                                .isFindingAddress.value ==
                                            true
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : ElevatedButton(
                                            onPressed: () =>
                                                _coordinatesPolylineViewController
                                                    .drawPolylineToDestination(),
                                            child: const Text("Draw Polyline")),
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
