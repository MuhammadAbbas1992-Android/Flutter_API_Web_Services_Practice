import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GoogleMapWithPolylineAddressView extends StatefulWidget {
  const GoogleMapWithPolylineAddressView({super.key});

  @override
  State<GoogleMapWithPolylineAddressView> createState() =>
      _GoogleMapWithPolylineAddressViewState();
}

class _GoogleMapWithPolylineAddressViewState
    extends State<GoogleMapWithPolylineAddressView> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? currentPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  final TextEditingController searchController = TextEditingController();

  final String googleApiKey =
      "AIzaSyBtAubRGSlTZanGLTPT3JrKWsRCFAXZzrE"; // 🔹 Replace with your real key

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
      _markers.add(Marker(
        markerId: const MarkerId("current"),
        position: currentPosition!,
        infoWindow: const InfoWindow(title: "My Location"),
      ));
    });
  }

  /// ✅ Convert Address → LatLng using Geocoding API
  Future<LatLng?> _getCoordinatesFromAddress(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$googleApiKey";

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

  void _drawPolylineToDestination(LatLng destination) {
    if (currentPosition == null) return;

    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId("destination"),
        position: destination,
        infoWindow: const InfoWindow(title: "Destination"),
      ));

      _polylines.add(Polyline(
        polylineId: const PolylineId("route"),
        visible: true,
        color: Colors.blue,
        width: 4,
        points: [currentPosition!, destination],
      ));
    });
  }

  Future<void> _searchAndDrawRoute() async {
    final address = searchController.text.trim();
    if (address.isEmpty) return;

    LatLng? destination = await _getCoordinatesFromAddress(address);
    if (destination != null) {
      _drawPolylineToDestination(destination);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentPosition!,
                    zoom: 14,
                  ),
                  markers: _markers,
                  polylines: _polylines,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  right: 10,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                  labelText: "Enter Location Name"),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.blue),
                            onPressed: _searchAndDrawRoute,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
