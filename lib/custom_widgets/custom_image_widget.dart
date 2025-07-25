import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../res/constants/app_colors.dart';
import '../view_models/controllers/firebase_controllers/firebase_core_controllers/add_image_view_controller.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.addImageViewController,
  });

  final AddImageViewController addImageViewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        height: 320,
        decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.pink, width: 1)),
        child: Center(
            child: addImageViewController.imagePath.value.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.file(
                      File(addImageViewController.imagePath.value),
                      fit: BoxFit.fill,
                      width: Get.width,
                      height: 320,
                    ),
                  )
                : SvgPicture.asset('assets/icons/ic_photo.svg')),
      ),
    );
  }
}
