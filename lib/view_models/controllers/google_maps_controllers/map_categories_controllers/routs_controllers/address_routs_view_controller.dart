import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class CoordinatesAllCategoryViewController extends GetxController {
  late Completer<GoogleMapController> controller;
  LatLng? currentPosition;
  LatLng? destinationPosition;
  RxString errorMessage = ''.obs;
  final RxSet<Marker> _markers = <Marker>{}.obs;
  final RxSet<Polyline> _polylines = <Polyline>{}.obs;
  final RxSet<Circle> _circles = <Circle>{}.obs;
  final TextEditingController searchController =
      TextEditingController(text: 'Lahore');

  //Google Map API Key not working..
  final String googleApiKey =
      "AIzaSyBtAubRGSlTZanGLTPT3JrKWsRCFAXZzrE"; // 🔹 Replace with your real key
  //app.gomaps.pro Map API Key is working...
  final String goMapApiKey =
      "AlzaSyabVY0fX-pDOPR5g4P0PhdZO2-6eeuJStr"; // 🔹 Replace with your real key

  RxBool isPositionLoaded = false.obs;

  CoordinatesAllCategoryViewController() {
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

  Future<void> searchAndDrawRoute() async {
    final address = searchController.value.text.trim();
    if (address.isEmpty) {
      AppUtils.mySnackBar(
          title: 'Alert',
          message: 'Please, enter any location which you want to search');
      return;
    }
    try {
      destinationPosition = await _getCoordinatesFromAddress(address);
      if (destinationPosition != null) {
        _drawPolylineToDestination();
      } else {
        AppUtils.mySnackBar(
            title: 'Error',
            message:
                "⚠️Failed to find coordinated of destination . Check your API key or location.");
      }
    } catch (e) {
      AppUtils.mySnackBar(title: 'Error', message: '$e');
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

  Future<void> _drawPolylineToDestination() async {
    if (currentPosition == null) return;

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
              '${destinationPosition?.latitude},${destinationPosition?.longitude}',
          anchor: const Offset(.5, 0.0)),
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
      } else {
        AppUtils.mySnackBar(
            title: 'Error',
            message:
                "⚠️Polyline coordinates from current position to destination position not found. Check your API key or location.");
      }
    } catch (e) {
      AppUtils.mySnackBar(title: 'Error', message: '$e');
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

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'Fetching time out after 30 seconds.\nPlease try again.');
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // ✅ Check if routes exist
        if (data['status'] == 'OK' || !data['routes'].isEmpty) {
          final points = data['routes'][0]['overview_polyline']['points'];
          List<LatLng> polylineCoords = _decodePolyline(points);
          return polylineCoords;
        } else {
          throw Exception('No polyline Coordinates found: ${data['status']}');
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
