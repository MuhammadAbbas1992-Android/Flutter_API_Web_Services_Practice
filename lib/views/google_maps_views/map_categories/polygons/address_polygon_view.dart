import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/polygons_controllers/address_polygon_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/polyline_map_address_view_controller.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPolygonView extends StatefulWidget {
  const AddressPolygonView({super.key});

  @override
  State<AddressPolygonView> createState() => _AddressPolygonViewState();
}

class _AddressPolygonViewState extends State<AddressPolygonView> {
  late final AddressPolygonViewController _addressPolygonViewController;

  @override
  void initState() {
    super.initState();
    _addressPolygonViewController = Get.put(AddressPolygonViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _addressPolygonViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: CustomTextWidget(
              text: 'Address Polygon Map',
            )),
            backgroundColor: Colors.blue.shade500,
          ),
          body: Obx(
            () => _addressPolygonViewController.errorMessage.value.isNotEmpty
                ? Container(
                    color: AppColors.lightGrey,
                    child: Center(
                      child: CustomTextWidget(
                        text: _addressPolygonViewController.errorMessage.value,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : _addressPolygonViewController.isPositionLoaded.value == false
                    ? const Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: _addressPolygonViewController
                                  .currentPosition!,
                              zoom: 14,
                            ),
                            markers: _addressPolygonViewController.markers,
                            polygons: _addressPolygonViewController.polygons,
                            onMapCreated: (GoogleMapController controller) {
                              _addressPolygonViewController.controller
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
                                            _addressPolygonViewController
                                                .searchController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter Location Name"),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.search,
                                          color: Colors.blue),
                                      onPressed: () =>
                                          _addressPolygonViewController
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
