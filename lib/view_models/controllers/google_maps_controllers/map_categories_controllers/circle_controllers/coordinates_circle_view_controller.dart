import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class CoordinatesCircleViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  LatLng? destinationPosition;
  RxString errorMessage = ''.obs;
  RxBool isPositionLoaded = false.obs;
  RxBool isFindingAddress = false.obs;

  final RxSet<Marker> _markers = <Marker>{}.obs;
  final RxSet<Polyline> _polylines = <Polyline>{}.obs;
  final RxSet<Circle> _circles = <Circle>{}.obs;

  final TextEditingController latController =
      TextEditingController(text: '24.860966');
  final TextEditingController lngController =
      TextEditingController(text: '66.990501');

  //Google Map API Key not working..
  final String googleApiKey =
      "AIzaSyBtAubRGSlTZanGLTPT3JrKWsRCFAXZzrE"; // 🔹 Replace with your real key
  //app.gomaps.pro Map API Key is working...
  final String goMapApiKey =
      "AlzaSyabVY0fX-pDOPR5g4P0PhdZO2-6eeuJStr"; // 🔹 Replace with your real key

  CoordinatesCircleViewController() {
    errorMessage.value = '';
    controller = Completer();
    _getCurrentLocation();
  }

  Set<Marker> get markers => _markers.toSet();

  Set<Polyline> get polylines => _polylines.toSet();

  Set<Circle> get circles => _circles.toSet();

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
    if (currentPosition == null) {
      AppUtils.mySnackBar(
          title: 'Warning',
          message: 'Please provide correct Latitude and Longitude');
      isFindingAddress.value = false;
      return;
    }

    isFindingAddress.value = true;
    double? destLat = double.tryParse(latController.value.text);
    double? destLng = double.tryParse(lngController.value.text);

    if (destLat == null || destLng == null) return;
    destinationPosition = LatLng(destLat, destLng);

    // ✅ Clear previous destination marker & polyline
    _markers.removeWhere((m) => m.markerId.value == "destination");
    _polylines.clear();
    _circles.clear();

    // ✅ Add new marker
    _markers.add(Marker(
      markerId: const MarkerId("destination"),
      position: destinationPosition!,
      infoWindow: InfoWindow(
          title: "Destination",
          snippet:
              '${destinationPosition?.latitude},${destinationPosition?.longitude}'),
    ));

    try {
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
          center: LatLng(
              destinationPosition!.latitude, destinationPosition!.longitude),
          radius: 1000,
          fillColor: AppColors.pink.withOpacity(0.3),
          strokeColor: AppColors.pink,
          strokeWidth: 2,
        ));

// ✅ Force UI update
        _markers.refresh();
        _polylines.refresh();
        _circles.refresh();
        isFindingAddress.value = false;
      } else {
        AppUtils.mySnackBar(
            title: 'Error',
            message:
                "⚠️Failed to find coordinated of destination . Check your API key or location.");
        isFindingAddress.value = false;
      }
    } catch (e) {
      AppUtils.mySnackBar(title: 'Error', message: '$e');
      isFindingAddress.value = false;
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
}
