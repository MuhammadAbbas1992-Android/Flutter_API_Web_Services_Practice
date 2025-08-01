import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/share_current_location_view_controller.dart';

import 'package:get/get.dart';

import '../../custom_widgets/custom_text_widget.dart';

class ShareCurrentLocationView extends StatefulWidget {
  const ShareCurrentLocationView({super.key});

  @override
  State<ShareCurrentLocationView> createState() =>
      _ShareCurrentLocationViewState();
}

class _ShareCurrentLocationViewState extends State<ShareCurrentLocationView> {
  late final ShareCurrentLocationViewController
      _shareCurrentLocationViewController;

  @override
  void initState() {
    super.initState();
    _shareCurrentLocationViewController =
        Get.put(ShareCurrentLocationViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _shareCurrentLocationViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: CustomTextWidget(
          text: 'Share current location',
        )),
        backgroundColor: Colors.blue.shade500,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () =>
              _shareCurrentLocationViewController.getAndShareLocation(),
          icon: const Icon(Icons.share_location),
          label: const Text("Share My Location"),
        ),
      ),
    );
  }
}
