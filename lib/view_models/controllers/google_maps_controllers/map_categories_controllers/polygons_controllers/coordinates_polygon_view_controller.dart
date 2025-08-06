import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoordinatesPolygonViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  RxString errorMessage = ''.obs;
  final RxSet<Marker> _markers = <Marker>{}.obs;
  final RxSet<Polygon> _polygon = <Polygon>{}.obs;
  final TextEditingController latController =
      TextEditingController(text: '31.582045');
  final TextEditingController lngController =
      TextEditingController(text: '74.329376');

  RxBool isPositionLoaded = false.obs;

  CoordinatesPolygonViewController() {
    errorMessage.value = '';
    controller = Completer();
    _getCurrentLocation();
  }

  Set<Marker> get markers => _markers.toSet();
  Set<Polygon> get polygon => _polygon.toSet();

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

  Future<void> drawPolylineToDestination() async {
    if (currentPosition == null) return;

    double? destLat = double.tryParse(latController.value.text);
    double? destLng = double.tryParse(lngController.value.text);

    if (destLat == null || destLng == null) return;

    LatLng destinationPosition = LatLng(destLat, destLng);

    // ✅ Clear previous destination marker & polyline
    _markers.removeWhere((m) => m.markerId.value == "destination");
    _polygon.clear();

    // ✅ Add new marker
    _markers.add(Marker(
      markerId: const MarkerId("destination"),
      position: destinationPosition,
      infoWindow: InfoWindow(
          title: "Destination",
          snippet:
              '${destinationPosition.latitude},${destinationPosition.longitude}'),
    ));

    final polygonPoints = generatePolygonPoints(currentPosition!, 1000);
    _polygon.add(Polygon(
      polygonId: const PolygonId('area1'),
      points: polygonPoints,
      fillColor: Colors.green.withOpacity(0.3),
      strokeColor: Colors.black,
      strokeWidth: 2,
    ));
    // ✅ Force UI update
    _polygon.refresh();
    _markers.refresh();
  }

  //Just an example to get Polygons point to draw.
  // But different APIs can be used for getting Polygons points
  List<LatLng> generatePolygonPoints(LatLng center, double radiusInMeters) {
    const int numPoints = 10; // Number of vertices in polygon
    const double earthRadius = 6378137.0; // Earth's radius in meters
    List<LatLng> points = [];

    double lat = center.latitude * pi / 180;
    double lng = center.longitude * pi / 180;

    for (int i = 0; i < numPoints; i++) {
      double angle = (i / numPoints) * 2 * pi;

      // Offset in radians
      double latOffset = (radiusInMeters / earthRadius) * cos(angle);
      double lngOffset = (radiusInMeters / earthRadius) * sin(angle) / cos(lat);

      // Convert back to degrees
      double newLat = lat + latOffset;
      double newLng = lng + lngOffset;

      points.add(LatLng(newLat * 180 / pi, newLng * 180 / pi));
    }

    return points;
  }
}
