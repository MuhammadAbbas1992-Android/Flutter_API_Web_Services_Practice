import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_firestore_or_cloud_firestore_controllers/home_db_cloud_s_b_view_controller.dart';
import 'package:get/get.dart';

import '../../common/common_text_widget.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_fonts.dart';
import '../../view_models/controllers/firebase_controllers/firebase_list_controllers/home_list_view_controller.dart';

class CustomCategoryWidget extends StatelessWidget {
  const CustomCategoryWidget({
    super.key,
    this.homeListViewController,
    this.homeDbRealtimeSBViewController,
    this.homeDbCloudSBViewController,
  });

  final HomeListViewController? homeListViewController;
  final HomeDbRealtimeSBViewController? homeDbRealtimeSBViewController;
  final HomeDbCloudSBViewController? homeDbCloudSBViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => homeListViewController != null
              ? homeListViewController?.selectAllPictures()
              : homeDbRealtimeSBViewController != null
                  ? homeDbRealtimeSBViewController?.selectAllPictures()
                  : homeDbCloudSBViewController?.selectAllPictures(),
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
          onTap: () => homeListViewController != null
              ? homeListViewController?.selectUnprocessedPictures(0)
              : homeDbRealtimeSBViewController != null
                  ? homeDbRealtimeSBViewController?.selectUnprocessedPictures(0)
                  : homeDbCloudSBViewController?.selectUnprocessedPictures(0),
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
          onTap: () => homeListViewController != null
              ? homeListViewController?.selectUnprocessedPictures(1)
              : homeDbRealtimeSBViewController != null
                  ? homeDbRealtimeSBViewController?.selectUnprocessedPictures(1)
                  : homeDbCloudSBViewController?.selectUnprocessedPictures(1),
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
