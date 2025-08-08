import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/map_categories_controllers/polygons_controllers/coordinates_polygon_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoordinatesPolygonView extends StatefulWidget {
  const CoordinatesPolygonView({super.key});

  @override
  State<CoordinatesPolygonView> createState() => _CoordinatesPolygonViewState();
}

class _CoordinatesPolygonViewState extends State<CoordinatesPolygonView> {
  late final CoordinatesPolygonViewController _coordinatesPolygonViewController;

  @override
  void initState() {
    super.initState();
    _coordinatesPolygonViewController =
        Get.put(CoordinatesPolygonViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _coordinatesPolygonViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'Coordinates Polygon Map',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: Obx(
          () => _coordinatesPolygonViewController.errorMessage.value.isNotEmpty
              ? Container(
                  color: AppColors.lightGrey,
                  child: Center(
                    child: CustomTextWidget(
                      text:
                          _coordinatesPolygonViewController.errorMessage.value,
                      color: AppColors.black,
                    ),
                  ),
                )
              : _coordinatesPolygonViewController.isPositionLoaded.value ==
                      false
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        GoogleMap(
                          mapType: MapType.satellite,
                          initialCameraPosition: CameraPosition(
                            target: _coordinatesPolygonViewController
                                .currentPosition!,
                            zoom: 14,
                          ),
                          markers: _coordinatesPolygonViewController.markers,
                          polygons: _coordinatesPolygonViewController.polygon,
                          onMapCreated: (GoogleMapController controller) {
                            _coordinatesPolygonViewController.controller
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
                              child: Column(
                                children: [
                                  TextField(
                                    controller:
                                        _coordinatesPolygonViewController
                                            .latController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: "Enter Latitude"),
                                  ),
                                  TextField(
                                    controller:
                                        _coordinatesPolygonViewController
                                            .lngController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: "Enter Longitude"),
                                  ),
                                  const SizedBox(height: 5),
                                  _coordinatesPolygonViewController
                                              .isFindingAddress.value ==
                                          true
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : ElevatedButton(
                                          onPressed: () =>
                                              _coordinatesPolygonViewController
                                                  .drawPolylineToDestination(),
                                          child: const Text("Draw Polygon")),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        ));
  }
}
