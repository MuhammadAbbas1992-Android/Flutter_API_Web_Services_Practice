import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/google_maps_controllers/share_current_location_view_controller.dart';

import 'package:get/get.dart';

import '../../custom_widgets/custom_text_widget.dart';
import '../../res/constants/app_colors.dart';

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
        body: Stack(
          children: [
            Obx(() => _shareCurrentLocationViewController
                    .isSharingLocation.value
                ? _shareCurrentLocationViewController
                        .errorMessage.value.isNotEmpty
                    ? Container(
                        color: AppColors.lightGrey,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CustomTextWidget(
                              text: _shareCurrentLocationViewController
                                  .errorMessage.value,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      )
                    : _shareCurrentLocationViewController.isLocationShared.value
                        ? const SizedBox.shrink()
                        : const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () => _shareCurrentLocationViewController
                        .getAndShareLocation(),
                    icon: const Icon(Icons.share_location),
                    label: const Text("Share My Location"),
                  )),
            ),
          ],
        ));
  }
}
