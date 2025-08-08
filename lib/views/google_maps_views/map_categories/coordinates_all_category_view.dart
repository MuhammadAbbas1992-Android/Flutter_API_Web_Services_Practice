import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/all_in_one_category_controller/coordinates_all_category_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../custom_widgets/custom_text_widget.dart';
import '../../../../res/constants/app_colors.dart';

class CoordinatesAllCategoryView extends StatefulWidget {
  const CoordinatesAllCategoryView({super.key});

  @override
  State<CoordinatesAllCategoryView> createState() =>
      _CoordinatesAllCategoryViewState();
}

class _CoordinatesAllCategoryViewState
    extends State<CoordinatesAllCategoryView> {
  late final CoordinatesAllCategoryViewController
      _coordinatesCircleViewController;

  @override
  void initState() {
    super.initState();
    _coordinatesCircleViewController =
        Get.put(CoordinatesAllCategoryViewController());
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
              text: 'Coordinates All Categories',
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
                            mapType: MapType.satellite,
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
                              top: 10,
                              left: 10,
                              right: Get.width * .8,
                              child: InkWell(
                                onTap: () => _coordinatesCircleViewController
                                    .togglePanel(),
                                child: Card(
                                  color: AppColors.pink,
                                  child: _coordinatesCircleViewController
                                              .isShowingPanel.value ==
                                          true
                                      ? const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text('Hide'),
                                          ),
                                        )
                                      : const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text('Show'),
                                          ),
                                        ),
                                ),
                              )),
                          _coordinatesCircleViewController
                                      .isShowingPanel.value ==
                                  true
                              ? Positioned(
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
                                              child:
                                                  const Text("Draw Circles")),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
          )),
    );
  }
}
