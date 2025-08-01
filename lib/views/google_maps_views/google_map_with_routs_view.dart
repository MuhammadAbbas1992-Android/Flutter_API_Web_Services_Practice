import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class GoogleMapWithRoutsView extends StatefulWidget {
  const GoogleMapWithRoutsView({super.key});

  @override
  State<GoogleMapWithRoutsView> createState() => _GoogleMapWithRoutsViewState();
}

class _GoogleMapWithRoutsViewState extends State<GoogleMapWithRoutsView> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? currentPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  final TextEditingController latController =
      TextEditingController(text: '31.582045');
  final TextEditingController lngController =
      TextEditingController(text: '74.329376');

  //Google Map API Key not working..
  final String googleApiKey =
      "AIzaSyBtAubRGSlTZanGLTPT3JrKWsRCFAXZzrE"; // 🔹 Replace with your real key
  //app.gomaps.pro Map API Key is working...
  final String goMapApiKey =
      "AlzaSyabVY0fX-pDOPR5g4P0PhdZO2-6eeuJStr"; // 🔹 Replace with your real key

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

  Future<void> _drawRouteFromAPI() async {
    if (currentPosition == null) return;

    double? destLat = double.tryParse(latController.value.text);
    double? destLng = double.tryParse(lngController.value.text);
    if (destLat == null || destLng == null) return;

    LatLng destination = LatLng(destLat, destLng);
    AppUtils.mySnackBar(
        title: 'Coordinates',
        message: '${destination.latitude},${destination.longitude}');

    // Add destination marker
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId("destination"),
        position: destination,
        infoWindow: const InfoWindow(title: "Destination"),
      ));
    });

    //Google Map API Key not working...
    /* String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${currentPosition!.latitude},${currentPosition!.longitude}&destination=${destination.latitude},${destination.longitude}&key=$goMapApiKey";*/
    //app.gomaps.pro Map API Key is working...
    String url =
        'https://maps.gomaps.pro/maps/api/directions/json?origin=${currentPosition!.latitude},${currentPosition!.longitude}&destination=${destination.latitude},${destination.longitude}&key=$goMapApiKey';
    AppUtils.mySnackBar(title: 'URL', message: url);
    print('ABC Url: $url');
    final response = await http.get(Uri.parse(url));
    AppUtils.mySnackBar(title: 'response', message: url);
    print('ABC Response: $response');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('ABC data: $data');

      // ✅ Check if routes exist
      if (data['status'] != 'OK' || data['routes'].isEmpty) {
        AppUtils.mySnackBar(
            title: 'Error',
            message: "⚠️ No route found. Check your API key or location.");
        AppUtils.mySnackBar(
            title: 'Warning',
            message:
                "⚠️ The Direction API is not enabled. That's why Routs not showing only destination is showing");
        return;
      }

      final points = data['routes'][0]['overview_polyline']['points'];
      List<LatLng> polylineCoords = _decodePolyline(points);

      setState(() {
        _polylines.add(Polyline(
          polylineId: const PolylineId("route"),
          visible: true,
          width: 5,
          color: Colors.blue,
          points: polylineCoords,
        ));
      });
    } else {
      print("");
      AppUtils.mySnackBar(
          title: 'Error',
          message: "Error fetching route: ${response.statusCode}");
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
                      child: Column(
                        children: [
                          TextField(
                            controller: latController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: "Enter Latitude"),
                          ),
                          TextField(
                            controller: lngController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: "Enter Longitude"),
                          ),
                          ElevatedButton(
                              onPressed: _drawRouteFromAPI,
                              child: const Text("Draw Route")),
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
