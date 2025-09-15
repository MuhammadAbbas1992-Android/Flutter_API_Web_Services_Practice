import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widgets/other_custom_widgets/custom_button_widget.dart';
import '../../../custom_widgets/other_custom_widgets/custom_elevation_button_widget.dart';
import '../../../custom_widgets/other_custom_widgets/custom_header_widget.dart';
import '../../../custom_widgets/other_custom_widgets/custom_image_widget.dart';
import '../../../custom_widgets/other_custom_widgets/custom_name_widget.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_core_controllers/add_image_view_controller.dart';

class AddImageView extends StatefulWidget {
  const AddImageView({super.key});

  @override
  State<AddImageView> createState() => _AddImageViewState();
}

class _AddImageViewState extends State<AddImageView> {
  late final AddImageViewController addImageViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addImageViewController = Get.put(AddImageViewController());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.back(result: false);
          return true;
        },
        child: SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  CommonHeaderWidget(
                    logo: 'assets/images/logo.png',
                    icon: 'assets/icons/ic_close1.svg',
                    onTap: () => addImageViewController.closeScreen(),
                  ),
                  CustomImageWidget(
                    addImageViewController: addImageViewController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomNameWidget(
                    addImageViewController: addImageViewController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CommonElevationButtonWidget(
                    icon: 'assets/icons/ic_img.svg',
                    text: 'Select from Gallery',
                    addImageViewController: addImageViewController,
                    isCamera: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CommonElevationButtonWidget(
                    icon: 'assets/icons/ic_camera.svg',
                    text: 'Take photo with camera',
                    addImageViewController: addImageViewController,
                    isCamera: true,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  CustomButtonWidget(
                    text: 'Upload Now',
                    addImageViewController: addImageViewController,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
