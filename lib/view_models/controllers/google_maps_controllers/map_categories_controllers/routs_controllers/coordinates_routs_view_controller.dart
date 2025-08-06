import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class CoordinatesRoutsViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  LatLng? destinationPosition;
  RxString errorMessage = ''.obs;
  final RxSet<Marker> _markers = <Marker>{}.obs;
  final RxSet<Polyline> _polylines = <Polyline>{}.obs;
  final TextEditingController latController =
      TextEditingController(text: '24.860966');
  final TextEditingController lngController =
      TextEditingController(text: '66.990501');
  RxBool isPositionLoaded = false.obs;

  //Google Map API Key not working..
  final String googleApiKey =
      "AIzaSyBtAubRGSlTZanGLTPT3JrKWsRCFAXZzrE"; // 🔹 Replace with your real key
  //app.gomaps.pro Map API Key is working...
  final String goMapApiKey =
      "AlzaSyabVY0fX-pDOPR5g4P0PhdZO2-6eeuJStr"; // 🔹 Replace with your real key

  CoordinatesRoutsViewController() {
    errorMessage.value = '';
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

  Future<void> searchPointsAndDrawRout() async {
    if (currentPosition == null) return;

    double? destLat = double.tryParse(latController.value.text);
    double? destLng = double.tryParse(lngController.value.text);

    if (destLat == null || destLng == null) return;

    destinationPosition = LatLng(destLat, destLng);

    // ✅ Clear previous destination marker & polyline
    _markers.removeWhere((m) => m.markerId.value == "destination");
    _polylines.clear();

    // ✅ Add new marker
    _markers.add(Marker(
      markerId: const MarkerId("destination"),
      position: destinationPosition!,
      infoWindow: InfoWindow(
          title: "Destination",
          snippet:
              '${destinationPosition?.latitude},${destinationPosition?.longitude}'),
    ));
    final polylineCoords = await _getPolylinePointsFromGoMapAPI();
    if (polylineCoords != null) {
      // ✅ Add polyline coordinates
      _polylines.add(Polyline(
        polylineId: const PolylineId("route"),
        visible: true,
        width: 5,
        color: Colors.blue,
        points: polylineCoords,
      ));

// ✅ Force UI update
      _markers.refresh();
      _polylines.refresh();
    } else {
      AppUtils.mySnackBar(
          title: 'Error',
          message:
              "⚠️Polyline coordinates from current position to destination position found. Check your API key or location.");
    }
  }

  // get Routs Points from source to destination
  Future<dynamic> _getPolylinePointsFromGoMapAPI() async {
    //Google Map API Key not working...
    /* String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${currentPosition!.latitude},${currentPosition!.longitude}&destination=${destination.latitude},${destination.longitude}&key=$goMapApiKey";*/
    //app.gomaps.pro Map API Key is working...
    String url =
        'https://maps.gomaps.pro/maps/api/directions/json?origin=${currentPosition!.latitude},${currentPosition!.longitude}&destination=${destinationPosition?.latitude},${destinationPosition?.longitude}&key=$goMapApiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // ✅ Check if routes exist
      if (data['status'] == 'OK' || !data['routes'].isEmpty) {
        final points = data['routes'][0]['overview_polyline']['points'];
        List<LatLng> polylineCoords = _decodePolyline(points);
        return polylineCoords;
      } else {
        AppUtils.mySnackBar(
            title: 'Error',
            message: "⚠️ No route found. Check your API key or location.");
        AppUtils.mySnackBar(
            title: 'Warning',
            message:
                "⚠️ The Direction API is not enabled. That's why Routs not showing only destination is showing");
        return null;
      }
    } else {
      AppUtils.mySnackBar(
          title: 'Error',
          message: "Error fetching route: ${response.statusCode}");
      return null;
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
}
