import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/routs_map_address_view_controller.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../custom_widgets/custom_text_widget.dart';
import '../../../../res/constants/app_colors.dart';

class RoutsMapAddressView extends StatefulWidget {
  const RoutsMapAddressView({super.key});

  @override
  State<RoutsMapAddressView> createState() => _RoutsMapAddressViewState();
}

class _RoutsMapAddressViewState extends State<RoutsMapAddressView> {
  late final RoutsMapAddressViewController _routsMapAddressViewController;

  @override
  void initState() {
    super.initState();
    _routsMapAddressViewController = Get.put(RoutsMapAddressViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _routsMapAddressViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Polyline Map Address',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _routsMapAddressViewController.errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text: _routsMapAddressViewController.errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _routsMapAddressViewController.isPositionLoaded.value == false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: _routsMapAddressViewController
                                  .currentPosition!,
                              zoom: 14,
                            ),
                            markers: _routsMapAddressViewController.markers,
                            polylines: _routsMapAddressViewController.polylines,
                            onMapCreated: (GoogleMapController controller) {
                              _routsMapAddressViewController.controller
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
                                            _routsMapAddressViewController
                                                .searchController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Location Name"),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.search,
                                          color: Colors.blue),
                                      onPressed: () =>
                                          _routsMapAddressViewController
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
