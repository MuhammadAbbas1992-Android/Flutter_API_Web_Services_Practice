import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/routs_controllers/address_routs_view_controller.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../custom_widgets/other_custom_widgets/custom_text_widget.dart';

class AddressCircleView extends StatefulWidget {
  const AddressCircleView({super.key});

  @override
  State<AddressCircleView> createState() => _AddressCircleViewState();
}

class _AddressCircleViewState extends State<AddressCircleView> {
  late final CoordinatesAllCategoryViewController _addressCircleViewController;

  @override
  void initState() {
    super.initState();
    _addressCircleViewController =
        Get.put(CoordinatesAllCategoryViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _addressCircleViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Address Circle Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _addressCircleViewController.errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text: _addressCircleViewController.errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _addressCircleViewController.isPositionLoaded.value == false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.satellite,
                            initialCameraPosition: CameraPosition(
                              target:
                                  _addressCircleViewController.currentPosition!,
                              zoom: 14,
                            ),
                            markers: _addressCircleViewController.markers,
                            polylines: _addressCircleViewController.polylines,
                            circles: _addressCircleViewController.circles,
                            onMapCreated: (GoogleMapController controller) {
                              _addressCircleViewController.controller
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
                                        controller: _addressCircleViewController
                                            .searchController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Location Name"),
                                      ),
                                    ),
                                    IconButton(
                                      icon: _addressCircleViewController
                                                  .isFindingAddress.value ==
                                              true
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : const Icon(Icons.search,
                                              color: AppColors.blue),
                                      onPressed: () =>
                                          _addressCircleViewController
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
