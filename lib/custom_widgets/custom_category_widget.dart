import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_stream_builder_l_v_b_view_controller.dart';
import 'package:get/get.dart';

import '../common/common_text_widget.dart';
import '../res/constants/app_colors.dart';
import '../res/constants/app_fonts.dart';

class CustomCategoryWidget extends StatelessWidget {
  const CustomCategoryWidget({
    super.key,
    required this.homeStreamAndListViewBuilderViewController,
  });

  final HomeStreamBuilderLVBViewController
      homeStreamAndListViewBuilderViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () =>
              homeStreamAndListViewBuilderViewController.selectAllPictures(),
          child: Container(
            height: 20,
            width: Get.width * .15,
            decoration: BoxDecoration(
                color: AppColors.blue, borderRadius: BorderRadius.circular(9)),
            child: const Center(
              child: CommonTextWidget(
                text: 'All',
                color: AppColors.white,
                size: 8,
                fontFamily: AppFonts.poppinsRegular,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () => homeStreamAndListViewBuilderViewController
              .selectUnprocessedPictures(0),
          child: Container(
            height: 20,
            width: Get.width * .18,
            decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(9)),
            child: const Center(
              child: CommonTextWidget(
                text: 'Processed',
                color: AppColors.white,
                size: 8,
                fontFamily: AppFonts.poppinsRegular,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () => homeStreamAndListViewBuilderViewController
              .selectUnprocessedPictures(1),
          child: Container(
            height: 20,
            width: Get.width * .18,
            decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(9)),
            child: const Center(
              child: CommonTextWidget(
                text: 'UnProcessed',
                color: AppColors.white,
                size: 8,
                fontFamily: AppFonts.poppinsRegular,
              ),
            ),
          ),
        )
      ],
    );
  }
}
