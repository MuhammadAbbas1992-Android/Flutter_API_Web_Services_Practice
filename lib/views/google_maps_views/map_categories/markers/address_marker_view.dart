import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/markers_controllers/address_marker_view_controller.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMarkerView extends StatefulWidget {
  const AddressMarkerView({super.key});

  @override
  State<AddressMarkerView> createState() => _AddressMarkerViewState();
}

class _AddressMarkerViewState extends State<AddressMarkerView> {
  late final AddressMarkerViewController _addressMarkerViewController;

  @override
  void initState() {
    super.initState();
    _addressMarkerViewController = Get.put(AddressMarkerViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _addressMarkerViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Address Marker Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _addressMarkerViewController.errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text: _addressMarkerViewController.errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _addressMarkerViewController.isPositionLoaded.value == false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.satellite,
                            initialCameraPosition: CameraPosition(
                              target:
                                  _addressMarkerViewController.currentPosition!,
                              zoom: 14,
                            ),
                            markers: _addressMarkerViewController.markers,
                            onMapCreated: (GoogleMapController controller) {
                              _addressMarkerViewController.controller
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
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _addressMarkerViewController
                                            .searchController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Location Name"),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.search,
                                          color: AppColors.blue),
                                      onPressed: () =>
                                          _addressMarkerViewController
                                              .searchAndDrawRoute(),
                                    )
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
