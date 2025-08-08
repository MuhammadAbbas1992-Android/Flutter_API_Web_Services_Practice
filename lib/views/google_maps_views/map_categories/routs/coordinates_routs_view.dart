import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/routs_controllers/coordinates_routs_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../custom_widgets/custom_text_widget.dart';
import '../../../../res/constants/app_colors.dart';

class CoordinatesRoutsView extends StatefulWidget {
  const CoordinatesRoutsView({super.key});

  @override
  State<CoordinatesRoutsView> createState() => _CoordinatesRoutsViewState();
}

class _CoordinatesRoutsViewState extends State<CoordinatesRoutsView> {
  late final CoordinatesRoutsViewController _coordinatesRoutsViewController;

  @override
  void initState() {
    super.initState();
    _coordinatesRoutsViewController = Get.put(CoordinatesRoutsViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _coordinatesRoutsViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Coordinates Routs Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _coordinatesRoutsViewController.errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text:
                            _coordinatesRoutsViewController.errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _coordinatesRoutsViewController.isPositionLoaded.value ==
                        false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.satellite,
                            initialCameraPosition: CameraPosition(
                              target: _coordinatesRoutsViewController
                                  .currentPosition!,
                              zoom: 14,
                            ),
                            markers: _coordinatesRoutsViewController.markers,
                            polylines:
                                _coordinatesRoutsViewController.polylines,
                            onMapCreated: (GoogleMapController controller) {
                              _coordinatesRoutsViewController.controller
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
                                          _coordinatesRoutsViewController
                                              .latController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: "Enter Latitude"),
                                    ),
                                    TextField(
                                      controller:
                                          _coordinatesRoutsViewController
                                              .lngController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: "Enter Longitude"),
                                    ),
                                    const SizedBox(height: 5),
                                    _coordinatesRoutsViewController
                                                .isFindingAddress.value ==
                                            true
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : ElevatedButton(
                                            onPressed: () =>
                                                _coordinatesRoutsViewController
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
