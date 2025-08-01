import 'dart:async';

import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ShareCurrentLocationViewController extends GetxController {
  Future<void> getAndShareLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((position) async {
        // ✅ Create Google Maps link
        String? locationLink;
        locationLink =
            "https://www.google.com/maps?q=${position.latitude},${position.longitude}";

        // ✅ Share the link
        Share.share("Here is my location: $locationLink");
      }).timeout(const Duration(seconds: 20), onTimeout: () {
        AppUtils.mySnackBar(
            title: 'Error',
            message: 'Fetching location timed out after 20 seconds, Try again');
      });
    } catch (e) {
      AppUtils.mySnackBar(
          title: 'Error', message: "❌ Error getting location: $e");
    }
  }
}
