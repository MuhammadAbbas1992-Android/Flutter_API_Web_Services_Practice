import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/routs_controllers/address_routs_view_controller.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressRoutsView extends StatefulWidget {
  const AddressRoutsView({super.key});

  @override
  State<AddressRoutsView> createState() => _AddressRoutsViewState();
}

class _AddressRoutsViewState extends State<AddressRoutsView> {
  late final AddressCircleViewController _addressRoutsViewController;

  @override
  void initState() {
    super.initState();
    _addressRoutsViewController = Get.put(AddressCircleViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _addressRoutsViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Address Routs Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _addressRoutsViewController.errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text: _addressRoutsViewController.errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _addressRoutsViewController.isPositionLoaded.value == false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.satellite,
                            initialCameraPosition: CameraPosition(
                              target:
                                  _addressRoutsViewController.currentPosition!,
                              zoom: 14,
                            ),
                            markers: _addressRoutsViewController.markers,
                            polylines: _addressRoutsViewController.polylines,
                            onMapCreated: (GoogleMapController controller) {
                              _addressRoutsViewController.controller
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
                                        controller: _addressRoutsViewController
                                            .searchController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Location Name"),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.search,
                                          color: AppColors.blue),
                                      onPressed: () =>
                                          _addressRoutsViewController
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
