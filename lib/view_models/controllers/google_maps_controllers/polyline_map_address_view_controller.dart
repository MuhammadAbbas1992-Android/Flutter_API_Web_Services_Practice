import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PolylineMapAddressViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  LatLng? destinationPosition;
  final RxSet<Marker> _markers = <Marker>{}.obs;
  final RxSet<Polyline> _polylines = <Polyline>{}.obs;
  final TextEditingController searchController =
      TextEditingController(text: 'Lahore');

  //Google Map API Key not working..
  final String googleApiKey =
      "AIzaSyBtAubRGSlTZanGLTPT3JrKWsRCFAXZzrE"; // 🔹 Replace with your real key
  //app.gomaps.pro Map API Key is working...
  final String goMapApiKey =
      "AlzaSyabVY0fX-pDOPR5g4P0PhdZO2-6eeuJStr"; // 🔹 Replace with your real key

  RxBool isPositionLoaded = false.obs;

  PolylineMapAddressViewController() {
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
        AppUtils.mySnackBar(
            title: 'Error',
            message: 'Fetching location timed out after 30 seconds, Try again');
      });
    } catch (e) {
      isPositionLoaded.value = true;
      AppUtils.mySnackBar(
          title: 'Error', message: "❌ Error getting location: $e");
    }
  }

  Future<void> searchAndDrawRoute() async {
    final address = searchController.value.text.trim();
    if (address.isEmpty) return;

    destinationPosition = await _getCoordinatesFromAddress(address);
    if (destinationPosition != null) {
      _drawPolylineToDestination();
    }
  }

  /// ✅ Convert Address → LatLng using Geocoding API
  Future<LatLng?> _getCoordinatesFromAddress(String address) async {
    final encodedAddress = Uri.encodeComponent(address);

    //Google Map API Key not working...
/*    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$googleApiKey";*/
    //app.gomaps.pro Map API Key is working...
    final url =
        'https://maps.gomaps.pro/maps/api/geocode/json?address=$encodedAddress&key=$goMapApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'OK' && data['results'].isNotEmpty) {
        final location = data['results'][0]['geometry']['location'];
        return LatLng(location['lat'], location['lng']);
      } else {
        AppUtils.mySnackBar(
            title: 'Google API Error', message: ": ${data['status']}");
        AppUtils.mySnackBar(
            title: 'Message', message: "No location found: ${data['status']}");
      }
    } else {
      AppUtils.mySnackBar(
          title: 'HTTP Error',
          message: "${response.statusCode} - ${response.body}");
    }
    return null;
  }

  void _drawPolylineToDestination() {
    if (currentPosition == null) return;

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
              '${destinationPosition?.latitude},${destinationPosition?.longitude}',
          anchor: const Offset(.5, 0.0)),
    ));

    // ✅ Add new polyline
    _polylines.add(Polyline(
      polylineId: const PolylineId("route"),
      visible: true,
      color: AppColors.blue,
      width: 4,
      points: [currentPosition!, destinationPosition!],
    ));

    // ✅ Force UI update
    _markers.refresh();
    _polylines.refresh();
  }
}
