import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/google_map_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../custom_widgets/custom_button_widget.dart';
import '../../../custom_widgets/custom_elevation_button_widget.dart';
import '../../../custom_widgets/custom_header_widget.dart';
import '../../../custom_widgets/custom_image_widget.dart';
import '../../../custom_widgets/custom_name_widget.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_core_controllers/add_image_view_controller.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(45.521563, -122.677433),
      infoWindow: InfoWindow(title: "Portland"),
    )
  };
  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.back(result: false);
          return true;
        },
        child: SafeArea(
            child: Scaffold(
                body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: markers,
        ))));
  }
}
