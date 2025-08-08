import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../res/app_utils.dart';

class CoordinatesMarkerViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  LatLng? destinationPosition;
  RxString errorMessage = ''.obs;
  RxBool isPositionLoaded = false.obs;
  RxBool isFindingAddress = false.obs;
  final RxSet<Marker> _markers = <Marker>{}.obs;

  final TextEditingController latController =
      TextEditingController(text: '31.582045');
  final TextEditingController lngController =
      TextEditingController(text: '74.329376');

  CoordinatesMarkerViewController() {
    errorMessage.value = '';
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

        _markers.add(Marker(
          markerId: const MarkerId("current"),
          position: currentPosition!,
          infoWindow: InfoWindow(
              title: "My Location",
              snippet:
                  '${currentPosition?.latitude},${currentPosition?.longitude}'),
        ));

        isPositionLoaded.value = true;
      }).timeout(const Duration(seconds: 30), onTimeout: () {
        isPositionLoaded.value = true;
        errorMessage.value =
            'Error❌:\nFetching location timed out after 30 seconds,\nTry again';
      });
    } catch (e) {
      isPositionLoaded.value = true;
      errorMessage.value = 'Error❌:\nGetting location: $e\nTry again';
    }
  }

  Future<void> drawDestinationMarker() async {
    if (currentPosition == null) return;

    isFindingAddress.value = true;
    double? destLat = double.tryParse(latController.value.text);
    double? destLng = double.tryParse(lngController.value.text);

    if (destLat == null || destLng == null) {
      AppUtils.mySnackBar(
          title: 'Warning',
          message: 'Please provide correct Latitude and Longitude');
      isFindingAddress.value = false;
      return;
    }

    destinationPosition = LatLng(destLat, destLng);

    // ✅ Clear previous destination marker & polyline
    _markers.removeWhere((m) => m.markerId.value == "destination");

    // ✅ Add new marker
    _markers.add(Marker(
      markerId: const MarkerId("destination"),
      position: destinationPosition!,
      infoWindow: InfoWindow(
          title: "Destination",
          snippet:
              '${destinationPosition?.latitude},${destinationPosition?.longitude}'),
    ));

    // ✅ Force UI update

    _markers.refresh();
    isFindingAddress.value = false;
  }
}
