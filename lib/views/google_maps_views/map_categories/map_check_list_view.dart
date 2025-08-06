import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../custom_widgets/custom_text_widget.dart';
import '../../../res/constants/app_colors.dart';
import '../../../view_models/controllers/google_maps_controllers/map_marker_view_controller.dart';

class MapCheckListView extends StatefulWidget {
  const MapCheckListView({super.key});

  @override
  State<MapCheckListView> createState() => _MapCheckListViewState();
}

class _MapCheckListViewState extends State<MapCheckListView> {
  late final MapCheckListViewController _mapMarkerViewController;

  @override
  void initState() {
    super.initState();
    _mapMarkerViewController = Get.put(MapCheckListViewController());
  }

  @override
  void dispose() {
    super.dispose();
    _mapMarkerViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              const Center(child: CustomTextWidget(text: 'Google Map Types')),
          backgroundColor: Colors.blue.shade500,
        ),
        body: Obx(() => _mapMarkerViewController.errorMessage.value.isNotEmpty
            ? Container(
                color: AppColors.lightGrey,
                child: Center(
                  child: CustomTextWidget(
                    text: _mapMarkerViewController.errorMessage.value,
                    color: AppColors.black,
                  ),
                ),
              )
            : !_mapMarkerViewController.isPositionLoaded.value
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      GoogleMap(
                        mapType: MapType.satellite,
                        initialCameraPosition: CameraPosition(
                          target: _mapMarkerViewController.currentPosition!,
                          zoom: 14,
                        ),
                        markers: _mapMarkerViewController.showMarkers.value
                            ? _mapMarkerViewController.markers
                            : <Marker>{},
                        polylines: _mapMarkerViewController.showPolylines.value
                            ? _mapMarkerViewController.polylines
                            : <Polyline>{},
                        polygons: _mapMarkerViewController.showPolygons.value
                            ? _mapMarkerViewController.polygons
                            : <Polygon>{},
                        circles: _mapMarkerViewController.showCircles.value
                            ? _mapMarkerViewController.circles
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

                      /// ✅ Checkbox UI
                      Positioned(
                        top: 20,
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
                                CheckboxListTile(
                                  title: const Text("Show Markers"),
                                  value: _mapMarkerViewController
                                      .showMarkers.value,
                                  onChanged: (val) {
                                    _mapMarkerViewController.showMarkers.value =
                                        val ?? false;
                                  },
                                ),
                                CheckboxListTile(
                                  title: const Text("Show Polylines"),
                                  value: _mapMarkerViewController
                                      .showPolylines.value,
                                  onChanged: (val) {
                                    _mapMarkerViewController
                                        .showPolylines.value = val ?? false;
                                  },
                                ),
                                CheckboxListTile(
                                  title: const Text("Show Circles"),
                                  value: _mapMarkerViewController
                                      .showCircles.value,
                                  onChanged: (val) {
                                    _mapMarkerViewController.showCircles.value =
                                        val ?? false;
                                  },
                                ),
                                CheckboxListTile(
                                  title: const Text("Show Polygons"),
                                  value: _mapMarkerViewController
                                      .showPolygons.value,
                                  onChanged: (val) {
                                    _mapMarkerViewController
                                        .showPolygons.value = val ?? false;
                                  },
                                ),

                                /// ✅ Button to Apply Changes
                                ElevatedButton(
                                  onPressed: () {
                                    _mapMarkerViewController.updateMapLayers();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white),
                                  child: const Text("Apply Changes"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
