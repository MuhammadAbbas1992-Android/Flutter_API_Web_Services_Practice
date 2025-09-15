import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/common_text_widget.dart';
import '../../res/constants/app_colors.dart';
import '../../view_models/controllers/firebase_controllers/firebase_core_controllers/add_image_view_controller.dart';

class CustomNameWidget extends StatelessWidget {
  const CustomNameWidget({
    super.key,
    required this.addImageViewController,
  });
  final AddImageViewController addImageViewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        height: 45,
        decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.pink, width: 1)),
        child: Center(
          child: CommonTextWidget(
            text: addImageViewController.imageName.value,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
