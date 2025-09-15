import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../common/common_text_widget.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_fonts.dart';
import '../../view_models/controllers/firebase_controllers/firebase_core_controllers/add_image_view_controller.dart';

class CommonElevationButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final String icon;
  final bool isCamera;
  final AddImageViewController addImageViewController;

  const CommonElevationButtonWidget({
    super.key,
    required this.text,
    this.fontSize = 15,
    required this.icon,
    required this.addImageViewController,
    required this.isCamera,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          if (isCamera) {
            addImageViewController.getImageFromGalleryOrCamera(true);
          } else {
            addImageViewController.getImageFromGalleryOrCamera(false);
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 3, // position the icon at left side
              child: SvgPicture.asset(
                icon,
              ),
            ),
            Center(
              child: CommonTextWidget(
                text: text,
                size: fontSize,
                color: AppColors.white,
                textAlign: TextAlign.center,
                fontFamily: AppFonts.poppinsSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
