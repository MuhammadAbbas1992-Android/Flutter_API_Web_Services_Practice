import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCheckListViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  RxString errorMessage = ''.obs;
  RxBool isPositionLoaded = false.obs;
  final RxSet<Marker> _markers = <Marker>{}.obs;
  var showMarkers = true.obs;
  var showPolylines = false.obs;
  var showCircles = false.obs;
  var showPolygons = false.obs;

  /// Existing properties
  var markers = <Marker>{};
  var polylines = <Polyline>{};
  var circles = <Circle>{};
  var polygons = <Polygon>{};

  MapCheckListViewController() {
    errorMessage.value = '';
    controller = Completer();
    _getCurrentLocation();
  }

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

  /// Method to process button click
  void updateMapLayers() {
    // Here you can add any logic when user presses apply
    // For example, load additional data, modify shapes dynamically, etc.
    print("✅ Map Layers Updated: "
        "Markers=${showMarkers.value}, "
        "Polylines=${showPolylines.value}, "
        "Circles=${showCircles.value}, "
        "Polygons=${showPolygons.value}");
    update();
  }
}
