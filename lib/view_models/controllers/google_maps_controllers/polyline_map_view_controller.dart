import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineMapViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  final RxSet<Marker> _markers = <Marker>{}.obs;
  final RxSet<Polyline> _polylines = <Polyline>{}.obs;
  final TextEditingController latController =
      TextEditingController(text: '31.582045');
  final TextEditingController lngController =
      TextEditingController(text: '74.329376');

  RxBool isPositionLoaded = false.obs;

  PolylineMapViewController() {
    controller = Completer();
    _getCurrentLocation();
  }

  Set<Marker> get markers => _markers.toSet();
  Set<Polyline> get polylines => _polylines.toSet();

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((position) async {
        currentPosition = LatLng(position.latitude, position.longitude);

        _markers.add(Marker(
          markerId: const MarkerId("current"),
          position: currentPosition!,
          infoWindow: InfoWindow(
              title: "My Location",
              snippet:
                  '${currentPosition?.latitude},${currentPosition?.longitude}'),
        ));

        isPositionLoaded.value = true;
      }).timeout(const Duration(seconds: 20), onTimeout: () {
        isPositionLoaded.value = true;
        AppUtils.mySnackBar(
            title: 'Error',
            message: 'Fetching location timed out after 20 seconds, Try again');
      });
    } catch (e) {
      isPositionLoaded.value = true;
      AppUtils.mySnackBar(
          title: 'Error', message: "❌ Error getting location: $e");
    }
  }

  void drawPolylineToDestination() {
    if (currentPosition == null) return;

    double? destLat = double.tryParse(latController.value.text);
    double? destLng = double.tryParse(lngController.value.text);

    if (destLat == null || destLng == null) return;

    LatLng destinationPosition = LatLng(destLat, destLng);

    // ✅ Clear previous destination marker & polyline
    _markers.removeWhere((m) => m.markerId.value == "destination");
    _polylines.clear();

    // ✅ Add new marker
    _markers.add(Marker(
      markerId: const MarkerId("destination"),
      position: destinationPosition,
      infoWindow: InfoWindow(
          title: "Destination",
          snippet:
              '${destinationPosition.latitude},${destinationPosition.longitude}'),
    ));

    // ✅ Add new polyline
    _polylines.add(Polyline(
      polylineId: const PolylineId("route"),
      visible: true,
      color: AppColors.blue,
      width: 4,
      points: [currentPosition!, destinationPosition],
    ));

    // ✅ Force UI update
    _markers.refresh();
    _polylines.refresh();
  }
}
