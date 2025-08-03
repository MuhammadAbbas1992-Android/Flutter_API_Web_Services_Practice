import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapTypesViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  RxString errorMessage = ''.obs;
  Rx<MapType> selectedMapType = MapType.none.obs;
  final RxSet<Marker> _markers = <Marker>{}.obs;
  RxBool isPositionLoaded = false.obs;
  RxBool isDisplayCoordinates = false.obs;

  // List of available map types
  final Map<String, MapType> listMapTypes = {
    "Normal": MapType.normal,
    "Satellite": MapType.satellite,
    "Terrain": MapType.terrain,
    "Hybrid": MapType.hybrid,
    "None": MapType.none,
  };

  GoogleMapTypesViewController() {
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

  void toggleButton() {
    _getCurrentLocation();
    isDisplayCoordinates.value = !isDisplayCoordinates.value;
  }
}
