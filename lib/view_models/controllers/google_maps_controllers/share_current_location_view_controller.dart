import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ShareCurrentLocationViewController extends GetxController {
  RxBool isSharingLocation = false.obs;
  RxBool isLocationShared = false.obs;
  RxString errorMessage = ''.obs;

  ShareCurrentLocationViewController() {
    isSharingLocation.value = false;
    isLocationShared.value = false;
    errorMessage.value = '';
  }

  Future<void> getAndShareLocation() async {
    isSharingLocation.value = true;
    errorMessage.value = '';

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
        isLocationShared.value = true;
      }).timeout(const Duration(seconds: 5), onTimeout: () {
        errorMessage.value =
            'TimeOut Error❌:\nFetching location timed out after 5 seconds,\nTry again';
      });
    } catch (e) {
      errorMessage.value = 'Getting location Error❌:\n$e\nTry again';
    }
  }
}
