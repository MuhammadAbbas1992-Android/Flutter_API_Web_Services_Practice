import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/circle_controllers/coordinates_circle_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/routs_controllers/coordinates_routs_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/routs_map_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../custom_widgets/custom_text_widget.dart';
import '../../../../res/constants/app_colors.dart';

class CoordinatesCircleView extends StatefulWidget {
  const CoordinatesCircleView({super.key});

  @override
  State<CoordinatesCircleView> createState() => _CoordinatesCircleViewState();
}

class _CoordinatesCircleViewState extends State<CoordinatesCircleView> {
  late final CoordinatesCircleViewController _coordinatesCircleViewController;

  @override
  void initState() {
    super.initState();
    _coordinatesCircleViewController =
        Get.put(CoordinatesCircleViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _coordinatesCircleViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Coordinates Circle Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _coordinatesCircleViewController.errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text:
                            _coordinatesCircleViewController.errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _coordinatesCircleViewController.isPositionLoaded.value ==
                        false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: _coordinatesCircleViewController
                                  .currentPosition!,
                              zoom: 14,
                            ),
                            markers: _coordinatesCircleViewController.markers,
                            polylines:
                                _coordinatesCircleViewController.polylines,
                            circles: _coordinatesCircleViewController.circles,
                            onMapCreated: (GoogleMapController controller) {
                              _coordinatesCircleViewController.controller
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
                                          _coordinatesCircleViewController
                                              .latController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: "Enter Latitude"),
                                    ),
                                    TextField(
                                      controller:
                                          _coordinatesCircleViewController
                                              .lngController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: "Enter Longitude"),
                                    ),
                                    ElevatedButton(
                                        onPressed: () =>
                                            _coordinatesCircleViewController
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
