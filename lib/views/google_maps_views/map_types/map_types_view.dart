import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/maps_types_controllers/map_types_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../custom_widgets/other_custom_widgets/custom_text_widget.dart';
import '../../../res/constants/app_colors.dart';

class MapTypesView extends StatefulWidget {
  const MapTypesView({super.key});

  @override
  State<MapTypesView> createState() => _MapTypesViewState();
}

class _MapTypesViewState extends State<MapTypesView> {
  late final MapTypesViewController _googleMapTypesViewController;

  @override
  void initState() {
    super.initState();
    _googleMapTypesViewController = Get.put(MapTypesViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _googleMapTypesViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Google Map Types',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(() => _googleMapTypesViewController
                  .errorMessage.value.isNotEmpty
              ? Container(
                  color: AppColors.lightGrey,
                  child: Center(
                    child: CustomTextWidget(
                      text: _googleMapTypesViewController.errorMessage.value,
                      color: AppColors.black,
                    ),
                  ),
                )
              : _googleMapTypesViewController.isPositionLoaded.value == false
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        GoogleMap(
                          mapType: _googleMapTypesViewController
                              .selectedMapType.value,
                          initialCameraPosition: CameraPosition(
                            target:
                                _googleMapTypesViewController.currentPosition!,
                            zoom: 14,
                          ),
                          markers: _googleMapTypesViewController.markers,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          buildingsEnabled: true,
                          trafficEnabled: true,
                          indoorViewEnabled: true,
                          compassEnabled: true,
                          fortyFiveDegreeImageryEnabled: true,
                          mapToolbarEnabled: true,
                          liteModeEnabled: true,
                          rotateGesturesEnabled: true,
                          scrollGesturesEnabled: true,
                          tiltGesturesEnabled: true,
                          zoomControlsEnabled: true,
                          zoomGesturesEnabled: true,
                        ),
                        // Dropdown positioned at top
                        Positioned(
                          top: 20,
                          left: 20,
                          right: 20,
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButton<MapType>(
                                isExpanded: true,
                                value: _googleMapTypesViewController
                                    .selectedMapType.value,
                                items: _googleMapTypesViewController
                                    .listMapTypes.entries
                                    .map((entry) {
                                  return DropdownMenuItem<MapType>(
                                    value: entry.value,
                                    child: Text(entry.key),
                                  );
                                }).toList(),
                                onChanged: (newType) {
                                  if (newType != null) {
                                    _googleMapTypesViewController
                                        .selectedMapType.value = newType;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))),
    );
  }
}
