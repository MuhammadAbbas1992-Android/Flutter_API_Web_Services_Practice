import 'dart:async';

import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  final RxSet<Marker> _markers = <Marker>{}.obs;
  RxBool isPositionLoaded = false.obs;
  RxBool isDisplayCoordinates = false.obs;

  GoogleMapViewController() {
    controller = Completer();
    _getCurrentLocation();
  }

  Set<Marker> get markers => _markers.toSet();

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((position) async {
        currentPosition = LatLng(position.latitude, position.longitude);

        // ✅ Clear previous destination marker & polyline
        _markers.removeWhere((m) => m.markerId.value == "current");

        _markers.add(Marker(
          markerId: const MarkerId("current"),
          position: currentPosition!,
          infoWindow: InfoWindow(
              title: "My Location",
              snippet:
                  '${currentPosition?.latitude},${currentPosition?.longitude}'),
        ));
        _markers.refresh();
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

  void toggleButton() {
    _getCurrentLocation();
    isDisplayCoordinates.value = !isDisplayCoordinates.value;
  }
}
