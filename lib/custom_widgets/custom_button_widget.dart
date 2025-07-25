import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/common_text_widget.dart';
import '../res/constants/app_colors.dart';
import '../res/constants/app_fonts.dart';
import '../view_models/controllers/firebase_controllers/firebase_core_controllers/add_image_view_controller.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final AddImageViewController addImageViewController;

  const CustomButtonWidget({
    super.key,
    required this.text,
    this.fontSize = 15,
    required this.addImageViewController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: Get.width,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: addImageViewController.isImageSet.value
                ? AppColors.pink
                : AppColors.lightPink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () => addImageViewController.addPicture(),
          child: addImageViewController.isLoading.value
              ? const SizedBox(
                  width: 50,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  ),
                )
              : CommonTextWidget(
                  text: text,
                  size: fontSize,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                  fontFamily: AppFonts.poppinsSemiBold,
                ),
        ),
      ),
    );
  }
}
