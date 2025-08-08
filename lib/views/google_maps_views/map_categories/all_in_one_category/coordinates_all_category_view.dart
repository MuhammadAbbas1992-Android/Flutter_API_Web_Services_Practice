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
      _coordinatesAllCategoryViewController;

  @override
  void initState() {
    super.initState();
    _coordinatesAllCategoryViewController =
        Get.put(CoordinatesAllCategoryViewController());
  }

  @override
  void dispose() {
    super.dispose();
    _coordinatesAllCategoryViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(text: 'Coordinates Categories Map')),
          backgroundColor: Colors.blue.shade500,
        ),
        body: Obx(() => _coordinatesAllCategoryViewController
                .errorMessage.value.isNotEmpty
            ? Container(
                color: AppColors.lightGrey,
                child: Center(
                  child: CustomTextWidget(
                    text: _coordinatesAllCategoryViewController
                        .errorMessage.value,
                    color: AppColors.black,
                  ),
                ),
              )
            : !_coordinatesAllCategoryViewController.isPositionLoaded.value
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      GoogleMap(
                        mapType: MapType.satellite,
                        initialCameraPosition: CameraPosition(
                          target: _coordinatesAllCategoryViewController
                              .currentPosition!,
                          zoom: 14,
                        ),
                        markers: _coordinatesAllCategoryViewController
                                .showMarkers.value
                            ? _coordinatesAllCategoryViewController.markers
                            : <Marker>{},
                        polylines: _coordinatesAllCategoryViewController
                                .showPolylines.value
                            ? _coordinatesAllCategoryViewController.polylines
                            : <Polyline>{},
                        polygons: _coordinatesAllCategoryViewController
                                .showPolygons.value
                            ? _coordinatesAllCategoryViewController.polygons
                            : <Polygon>{},
                        circles: _coordinatesAllCategoryViewController
                                .showCircles.value
                            ? _coordinatesAllCategoryViewController.circles
                            : <Circle>{},
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        buildingsEnabled: true,
                        trafficEnabled: true,
                        indoorViewEnabled: true,
                        compassEnabled: true,
                        mapToolbarEnabled: true,
                        liteModeEnabled: false,
                        rotateGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        tiltGesturesEnabled: true,
                        zoomControlsEnabled: true,
                        zoomGesturesEnabled: true,
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          right: Get.width * .8,
                          child: InkWell(
                            onTap: () => _coordinatesAllCategoryViewController
                                .togglePanel(),
                            child: Card(
                              color: AppColors.pink,
                              child: _coordinatesAllCategoryViewController
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
                      _coordinatesAllCategoryViewController
                                  .isShowingPanel.value ==
                              true
                          ? Positioned(
                              top: 40,
                              left: 20,
                              right: 20,
                              child: Card(
                                color: Colors.white,
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller:
                                            _coordinatesAllCategoryViewController
                                                .latController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Latitude"),
                                      ),
                                      TextField(
                                        controller:
                                            _coordinatesAllCategoryViewController
                                                .lngController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Longitude"),
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Markers"),
                                        value:
                                            _coordinatesAllCategoryViewController
                                                .showMarkers.value,
                                        onChanged: (val) {
                                          _coordinatesAllCategoryViewController
                                              .showMarkers.value = val ?? false;
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Polylines"),
                                        value:
                                            _coordinatesAllCategoryViewController
                                                .showPolylines.value,
                                        onChanged: (val) {
                                          _coordinatesAllCategoryViewController
                                              .showPolylines
                                              .value = val ?? false;
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Routs"),
                                        value:
                                            _coordinatesAllCategoryViewController
                                                .showRouts.value,
                                        onChanged: (val) {
                                          _coordinatesAllCategoryViewController
                                              .showRouts.value = val ?? false;
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Circles"),
                                        value:
                                            _coordinatesAllCategoryViewController
                                                .showCircles.value,
                                        onChanged: (val) {
                                          _coordinatesAllCategoryViewController
                                              .showCircles.value = val ?? false;
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Polygons"),
                                        value:
                                            _coordinatesAllCategoryViewController
                                                .showPolygons.value,
                                        onChanged: (val) {
                                          _coordinatesAllCategoryViewController
                                              .showPolygons
                                              .value = val ?? false;
                                        },
                                      ),
                                      _coordinatesAllCategoryViewController
                                                  .isFindingCoordinates.value ==
                                              true
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : ElevatedButton(
                                              onPressed: () {
                                                _coordinatesAllCategoryViewController
                                                    .searchPointsAndDrawMapCategories();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.blue,
                                                  foregroundColor:
                                                      AppColors.white),
                                              child:
                                                  const Text("Apply Changes"),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  )),
      ),
    );
  }
}
