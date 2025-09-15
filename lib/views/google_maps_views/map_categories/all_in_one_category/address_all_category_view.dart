import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/all_in_one_category_controller/address_all_category_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../custom_widgets/other_custom_widgets/custom_text_widget.dart';
import '../../../../res/constants/app_colors.dart';

class AddressAllCategoryView extends StatefulWidget {
  const AddressAllCategoryView({super.key});

  @override
  State<AddressAllCategoryView> createState() => _AddressAllCategoryViewState();
}

class _AddressAllCategoryViewState extends State<AddressAllCategoryView> {
  late final AddressAllCategoryViewController _addressAllCategoryViewController;

  @override
  void initState() {
    super.initState();
    _addressAllCategoryViewController =
        Get.put(AddressAllCategoryViewController());
  }

  @override
  void dispose() {
    super.dispose();
    _addressAllCategoryViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(text: 'Address Categories Map')),
          backgroundColor: Colors.blue.shade500,
        ),
        body: Obx(() => _addressAllCategoryViewController
                .errorMessage.value.isNotEmpty
            ? Container(
                color: AppColors.lightGrey,
                child: Center(
                  child: CustomTextWidget(
                    text: _addressAllCategoryViewController.errorMessage.value,
                    color: AppColors.black,
                  ),
                ),
              )
            : !_addressAllCategoryViewController.isPositionLoaded.value
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      GoogleMap(
                        mapType: MapType.satellite,
                        initialCameraPosition: CameraPosition(
                          target: _addressAllCategoryViewController
                              .currentPosition!,
                          zoom: 14,
                        ),
                        markers:
                            _addressAllCategoryViewController.showMarkers.value
                                ? _addressAllCategoryViewController.markers
                                : <Marker>{},
                        polylines: _addressAllCategoryViewController
                                .showPolylines.value
                            ? _addressAllCategoryViewController.polylines
                            : <Polyline>{},
                        polygons:
                            _addressAllCategoryViewController.showPolygons.value
                                ? _addressAllCategoryViewController.polygons
                                : <Polygon>{},
                        circles:
                            _addressAllCategoryViewController.showCircles.value
                                ? _addressAllCategoryViewController.circles
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
                            onTap: () =>
                                _addressAllCategoryViewController.togglePanel(),
                            child: Card(
                              color: AppColors.pink,
                              child: _addressAllCategoryViewController
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
                      _addressAllCategoryViewController.isShowingPanel.value ==
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
                                            _addressAllCategoryViewController
                                                .searchController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Location Name"),
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Markers"),
                                        value: _addressAllCategoryViewController
                                            .showMarkers.value,
                                        onChanged: (val) {
                                          _addressAllCategoryViewController
                                              .showMarkers.value = val ?? false;
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Polylines"),
                                        value: _addressAllCategoryViewController
                                            .showPolylines.value,
                                        onChanged: (val) {
                                          _addressAllCategoryViewController
                                              .showPolylines
                                              .value = val ?? false;
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Routs"),
                                        value: _addressAllCategoryViewController
                                            .showRouts.value,
                                        onChanged: (val) {
                                          _addressAllCategoryViewController
                                              .showRouts.value = val ?? false;
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Circles"),
                                        value: _addressAllCategoryViewController
                                            .showCircles.value,
                                        onChanged: (val) {
                                          _addressAllCategoryViewController
                                              .showCircles.value = val ?? false;
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text("Polygons"),
                                        value: _addressAllCategoryViewController
                                            .showPolygons.value,
                                        onChanged: (val) {
                                          _addressAllCategoryViewController
                                              .showPolygons
                                              .value = val ?? false;
                                        },
                                      ),
                                      _addressAllCategoryViewController
                                                  .isFindingCoordinates.value ==
                                              true
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : ElevatedButton(
                                              onPressed: () {
                                                _addressAllCategoryViewController
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
