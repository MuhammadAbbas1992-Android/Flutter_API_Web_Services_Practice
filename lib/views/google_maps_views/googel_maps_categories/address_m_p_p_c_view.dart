import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/polyline_map_address_view_controller.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../custom_widgets/custom_text_widget.dart';
import '../../../res/constants/app_colors.dart';

class PolylineMapAddressView extends StatefulWidget {
  const PolylineMapAddressView({super.key});

  @override
  State<PolylineMapAddressView> createState() => _PolylineMapAddressViewState();
}

class _PolylineMapAddressViewState extends State<PolylineMapAddressView> {
  late final PolylineMapAddressViewController _polylineMapAddressViewController;

  @override
  void initState() {
    super.initState();
    _polylineMapAddressViewController =
        Get.put(PolylineMapAddressViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _polylineMapAddressViewController.dispose();
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
            () => _polylineMapAddressViewController
                    .errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text: _polylineMapAddressViewController
                            .errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _polylineMapAddressViewController.isPositionLoaded.value ==
                        false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: _polylineMapAddressViewController
                                  .currentPosition!,
                              zoom: 14,
                            ),
                            markers: _polylineMapAddressViewController.markers,
                            polylines:
                                _polylineMapAddressViewController.polylines,
                            onMapCreated: (GoogleMapController controller) {
                              _polylineMapAddressViewController.controller
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
                                            _polylineMapAddressViewController
                                                .searchController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Location Name"),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.search,
                                          color: Colors.blue),
                                      onPressed: () =>
                                          _polylineMapAddressViewController
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
