import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class AddressAllCategoryViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  LatLng? destinationPosition;
  RxString errorMessage = ''.obs;
  RxBool isPositionLoaded = false.obs;
  RxBool isFindingCoordinates = false.obs;
  RxBool isShowingPanel = false.obs;

  RxBool showMarkers = false.obs;
  RxBool showPolylines = false.obs;
  RxBool showRouts = false.obs;
  RxBool showCircles = false.obs;
  RxBool showPolygons = false.obs;

  final RxSet<Marker> _markers = <Marker>{}.obs;
  final RxSet<Polyline> _polylines = <Polyline>{}.obs;
  final RxSet<Circle> _circles = <Circle>{}.obs;
  final RxSet<Polygon> _polygons = <Polygon>{}.obs;

  final TextEditingController searchController =
      TextEditingController(text: 'Lahore');

  Set<Marker> get markers => _markers.toSet();
  Set<Polyline> get polylines => _polylines.toSet();
  Set<Polygon> get polygons => _polygons.toSet();
  Set<Circle> get circles => _circles.toSet();

  //Google Map API Key not working..
  final String googleApiKey =
      "AIzaSyBtAubRGSlTZanGLTPT3JrKWsRCFAXZzrE"; // 🔹 Replace with your real key
  //app.gomaps.pro Map API Key is working...
  final String goMapApiKey =
      "AlzaSyabVY0fX-pDOPR5g4P0PhdZO2-6eeuJStr"; // 🔹 Replace with your real key

  AddressAllCategoryViewController() {
    errorMessage.value = '';
    controller = Completer();
    _getCurrentLocation();
  }

  void togglePanel() {
    isShowingPanel.value = !isShowingPanel.value;
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((position) async {
        currentPosition = LatLng(position.latitude, position.longitude);
        isPositionLoaded.value = true;
      }).timeout(const Duration(seconds: 30), onTimeout: () {
        errorMessage.value =
            'Error❌:\nFetching location timed out after 30 seconds,\nTry again';
        isPositionLoaded.value = true;
      });
    } catch (e) {
      errorMessage.value = 'Error❌:\nGetting location: $e\nTry again';
      isPositionLoaded.value = true;
    }
  }

  Future<void> searchPointsAndDrawMapCategories() async {
    if (currentPosition == null) return;

    isFindingCoordinates.value = true;
    final address = searchController.value.text.trim();
    if (address.isEmpty) {
      AppUtils.mySnackBar(
          title: 'Alert',
          message: 'Please, enter any location which you want to search');
      isFindingCoordinates.value = false;
      return;
    }

    try {
      destinationPosition = await _getCoordinatesFromAddress(address);
      if (destinationPosition != null) {
        // ✅ Clear previous destination marker & polyline
        _markers.removeWhere((m) => m.markerId.value == "destination");
        _polylines.clear();
        _circles.clear();
        _polygons.clear();

        if (showMarkers.value) {
          _addMarkers();
        }
        if (showPolylines.value) {
          await _addPolylinesAndRouts();
        }
        if (showCircles.value) {
          _addCircles();
        }
        if (showPolygons.value) {
          _addPolygons();
        }

// ✅ Force UI update
        _markers.refresh();
        _polylines.refresh();
        _circles.refresh();
        _polygons.refresh();
        isFindingCoordinates.value = false;
      } else {
        AppUtils.mySnackBar(
            title: 'Error',
            message:
                "⚠️Failed to find coordinated of destination . Check your API key or location.");
        isFindingCoordinates.value = false;
      }
    } catch (e) {
      AppUtils.mySnackBar(title: 'Error', message: '$e');
      isFindingCoordinates.value = false;
    }
  }

  void _addMarkers() {
    // ✅ Add current position
    _markers.add(Marker(
      markerId: const MarkerId("current"),
      position: currentPosition!,
      infoWindow: InfoWindow(
          title: "My Location",
          snippet:
              '${currentPosition?.latitude},${currentPosition?.longitude}'),
    ));
    // ✅ Add destination
    _markers.add(Marker(
      markerId: const MarkerId("destination"),
      position: destinationPosition!,
      infoWindow: InfoWindow(
          title: "Destination",
          snippet:
              '${destinationPosition?.latitude},${destinationPosition?.longitude}'),
    ));
  }

  Future<void> _addPolylinesAndRouts() async {
    try {
      final polylineCoords = await _getPolylinePointsFromGoMapAPI();
      if (polylineCoords != null) {
        // ✅ Add new polyline
        _polylines.add(Polyline(
          polylineId: const PolylineId("polyline"),
          visible: true,
          color: AppColors.blue,
          width: 4,
          points: [currentPosition!, destinationPosition!],
        ));
        if (showRouts.value) {
          // ✅ Add new Routs
          _polylines.add(Polyline(
            polylineId: const PolylineId("route"),
            visible: true,
            width: 5,
            color: AppColors.blue,
            points: polylineCoords,
          ));
        }
      } else {
        AppUtils.mySnackBar(
            title: 'Error',
            message:
                "⚠️Failed to find coordinated of destination . Check your API key or location.");
        isFindingCoordinates.value = false;
      }
    } catch (e) {
      AppUtils.mySnackBar(title: 'Error', message: '$e');
      isFindingCoordinates.value = false;
    }
  }

  void _addCircles() {
    _circles.add(Circle(
      circleId: const CircleId('circle1'),
      center: LatLng(currentPosition!.latitude, currentPosition!.longitude),
      radius: 1000,
      fillColor: AppColors.blue.withOpacity(0.3),
      strokeColor: AppColors.blue,
      strokeWidth: 2,
    ));
    _circles.add(Circle(
      circleId: const CircleId('circle2'),
      center:
          LatLng(destinationPosition!.latitude, destinationPosition!.longitude),
      radius: 1000,
      fillColor: AppColors.pink.withOpacity(0.3),
      strokeColor: AppColors.pink,
      strokeWidth: 2,
    ));
  }

  void _addPolygons() {
    final currentPolygonPoints = generatePolygonPoints(currentPosition!, 1000);
    _polygons.add(Polygon(
      polygonId: const PolygonId('polygon1'),
      points: currentPolygonPoints,
      fillColor: Colors.green.withOpacity(0.3),
      strokeColor: AppColors.black,
      strokeWidth: 2,
    ));
    final destinationPolygonPoints =
        generatePolygonPoints(destinationPosition!, 1000);
    _polygons.add(Polygon(
      polygonId: const PolygonId('polygon2'),
      points: destinationPolygonPoints,
      fillColor: Colors.green.withOpacity(0.3),
      strokeColor: AppColors.black,
      strokeWidth: 2,
    ));
  }

  Future<LatLng?> _getCoordinatesFromAddress(String address) async {
    final encodedAddress = Uri.encodeComponent(address);

    //Google Map API Key not working...
/*    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$googleApiKey";*/
    //app.gomaps.pro Map API Key is working...
    final url =
        'https://maps.gomaps.pro/maps/api/geocode/json?address=$encodedAddress&key=$goMapApiKey';

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'Fetching time out after 30 seconds.\nPlease try again.');
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          final location = data['results'][0]['geometry']['location'];
          return LatLng(location['lat'], location['lng']);
        } else {
          throw Exception('No destination found: ${data['status']}');
        }
      } else {
        throw Exception('⚠️Error fetching route: ${response.statusCode}');
      }
    } catch (e) {
      throw TimeoutException('⚠️Getting route failed: $e\nTry again');
    }
  }

  Future<dynamic> _getPolylinePointsFromGoMapAPI() async {
    //Google Map API Key not working...
    /* String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${currentPosition!.latitude},${currentPosition!.longitude}&destination=${destination.latitude},${destination.longitude}&key=$goMapApiKey";*/
    //app.gomaps.pro Map API Key is working...
    String url =
        'https://maps.gomaps.pro/maps/api/directions/json?origin=${currentPosition!.latitude},${currentPosition!.longitude}&destination=${destinationPosition?.latitude},${destinationPosition?.longitude}&key=$goMapApiKey';

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'Fetching time out after 30 seconds.\nPlease try again.');
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'OK' &&
            data['routes'] != null &&
            data['routes'].isNotEmpty) {
          final points = data['routes'][0]['overview_polyline']['points'];
          List<LatLng> polylineCoords = _decodePolyline(points);

          return polylineCoords;
        } else {
          throw Exception(
              '⚠️ No polyline coordinated found. Check API key or location values');
        }
      } else {
        throw Exception('⚠️Error fetching route: ${response.statusCode}');
      }
    } catch (e) {
      throw TimeoutException('⚠️Getting route failed: $e\nTry again');
    }
  }

  // 🔹 Decode Polyline String to LatLng List
  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      polyline.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return polyline;
  }

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
