import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/markers_controllers/coordinates_marker_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoordinatesMarkerView extends StatefulWidget {
  const CoordinatesMarkerView({super.key});

  @override
  State<CoordinatesMarkerView> createState() => _CoordinatesMarkerViewState();
}

class _CoordinatesMarkerViewState extends State<CoordinatesMarkerView> {
  late final CoordinatesMarkerViewController _coordinatesMarkerViewController;

  @override
  void initState() {
    super.initState();
    _coordinatesMarkerViewController =
        Get.put(CoordinatesMarkerViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _coordinatesMarkerViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'Coordinates Marker Map',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: Obx(
          () => _coordinatesMarkerViewController.errorMessage.value.isNotEmpty
              ? Container(
                  color: AppColors.lightGrey,
                  child: Center(
                    child: CustomTextWidget(
                      text: _coordinatesMarkerViewController.errorMessage.value,
                      color: AppColors.black,
                    ),
                  ),
                )
              : _coordinatesMarkerViewController.isPositionLoaded.value == false
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        GoogleMap(
                          mapType: MapType.satellite,
                          initialCameraPosition: CameraPosition(
                            target: _coordinatesMarkerViewController
                                .currentPosition!,
                            zoom: 14,
                          ),
                          markers: _coordinatesMarkerViewController.markers,
                          onMapCreated: (GoogleMapController controller) {
                            _coordinatesMarkerViewController.controller
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
                                    controller: _coordinatesMarkerViewController
                                        .latController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: "Enter Latitude"),
                                  ),
                                  TextField(
                                    controller: _coordinatesMarkerViewController
                                        .lngController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: "Enter Longitude"),
                                  ),
                                  const SizedBox(height: 5),
                                  _coordinatesMarkerViewController
                                              .isFindingAddress.value ==
                                          true
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : ElevatedButton(
                                          onPressed: () =>
                                              _coordinatesMarkerViewController
                                                  .drawDestinationMarker(),
                                          child: const Text("Draw Markers")),
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
