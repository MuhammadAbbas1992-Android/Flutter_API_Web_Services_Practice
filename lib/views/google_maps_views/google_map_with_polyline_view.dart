import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWithPolylineView extends StatefulWidget {
  const GoogleMapWithPolylineView({super.key});

  @override
  State<GoogleMapWithPolylineView> createState() =>
      _GoogleMapWithPolylineViewState();
}

class _GoogleMapWithPolylineViewState extends State<GoogleMapWithPolylineView> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? currentPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
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

  void _drawPolylineToDestination() {
    if (currentPosition == null) return;

    double? destLat = double.tryParse(latController.text);
    double? destLng = double.tryParse(lngController.text);

    if (destLat == null || destLng == null) return;

    LatLng destination = LatLng(destLat, destLng);

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
                              onPressed: _drawPolylineToDestination,
                              child: const Text("Draw Polyline")),
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
