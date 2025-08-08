import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/polylines_controllers/address_polyline_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPolylineView extends StatefulWidget {
  const AddressPolylineView({super.key});

  @override
  State<AddressPolylineView> createState() => _AddressPolylineViewState();
}

class _AddressPolylineViewState extends State<AddressPolylineView> {
  late final AddressPolylineViewController _addressPolylineViewController;

  @override
  void initState() {
    super.initState();
    _addressPolylineViewController = Get.put(AddressPolylineViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _addressPolylineViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Address Polyline Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _addressPolylineViewController.errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text: _addressPolylineViewController.errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _addressPolylineViewController.isPositionLoaded.value == false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.satellite,
                            initialCameraPosition: CameraPosition(
                              target: _addressPolylineViewController
                                  .currentPosition!,
                              zoom: 14,
                            ),
                            markers: _addressPolylineViewController.markers,
                            polylines: _addressPolylineViewController.polylines,
                            onMapCreated: (GoogleMapController controller) {
                              _addressPolylineViewController.controller
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
                                        controller:
                                            _addressPolylineViewController
                                                .searchController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Location Name"),
                                      ),
                                    ),
                                    IconButton(
                                      icon: _addressPolylineViewController
                                                  .isFindingAddress.value ==
                                              true
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : const Icon(Icons.search,
                                              color: AppColors.blue),
                                      onPressed: () =>
                                          _addressPolylineViewController
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
