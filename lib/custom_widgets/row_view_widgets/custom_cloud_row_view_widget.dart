import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_firestore_or_cloud_firestore_controllers/home_db_cloud_s_b_view_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../common/common_text_widget.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_fonts.dart';
import '../../view_models/controllers/firebase_controllers/firebase_list_controllers/home_list_view_controller.dart';
import '../other_custom_widgets/custom_dialog_box_widget.dart';

class CustomCloudRowViewWidget extends StatelessWidget {
  const CustomCloudRowViewWidget({
    super.key,
    required this.index,
    required this.homeDbCloudSBViewController,
  });

  final int index;
  final HomeDbCloudSBViewController homeDbCloudSBViewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            width: 1,
            color: AppColors.blue,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: homeDbCloudSBViewController.isAllData.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => homeDbCloudSBViewController.addPicture(
                                homeDbCloudSBViewController
                                    .picturesList[index]),
                            child: SvgPicture.asset(
                              'assets/icons/ic_edit.svg',
                              width: 20,
                              height: 20,
                              color: AppColors.pink,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              bool shouldDelete =
                                  await showDeleteConfirmationDialog(context);
                              if (shouldDelete) {
                                await homeDbCloudSBViewController
                                    .deleteItem(index);
                              }
                            },
                            child: SvgPicture.asset(
                              'assets/icons/ic_delete.svg',
                              width: 20,
                              height: 20,
                              color: AppColors.pink,
                            ),
                          )
                        ],
                      )
                    : null,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () =>
                      homeDbCloudSBViewController.openFullPictureView(index),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: homeDbCloudSBViewController.isAllData.value
                        ? CachedNetworkImage(
                            imageUrl: homeDbCloudSBViewController
                                .picturesList[index].imageUrl,
                            placeholder: (context, url) => const Center(
                                child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fill,
                            height: 155,
                            width: 156,
                          )
                        : CachedNetworkImage(
                            imageUrl: homeDbCloudSBViewController
                                .processedUnprocessedList[index].imageUrl,
                            placeholder: (context, url) => const Center(
                                child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fill,
                            height: 155,
                            width: 156,
                          ),
                  )),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextWidget(
                    text: homeDbCloudSBViewController.isAllData.value
                        ? homeDbCloudSBViewController
                                    .picturesList[index].processed ==
                                true
                            ? 'Processed'
                            : 'Unprocessed'
                        : homeDbCloudSBViewController
                                    .processedUnprocessedList[index]
                                    .processed ==
                                true
                            ? 'Processed'
                            : 'Unprocessed',
                    size: 11,
                    color: AppColors.black,
                    fontFamily: AppFonts.poppinsRegular,
                    textAlign: TextAlign.left,
                  ),
                  FlutterSwitch(
                    value: homeDbCloudSBViewController.isAllData.value
                        ? homeDbCloudSBViewController
                            .picturesList[index].processed!
                        : homeDbCloudSBViewController
                            .processedUnprocessedList[index].processed!,
                    onToggle: (value) =>
                        homeDbCloudSBViewController.toggle(value, index),
                    activeColor: AppColors.lightPink,
                    inactiveColor: AppColors.mediumGrey,
                    toggleColor: homeDbCloudSBViewController.isAllData.value
                        ? homeDbCloudSBViewController
                                    .picturesList[index].processed ==
                                true
                            ? AppColors.pink
                            : AppColors.lightGrey
                        : homeDbCloudSBViewController
                                    .processedUnprocessedList[index]
                                    .processed ==
                                true
                            ? AppColors.pink
                            : AppColors.lightGrey,
                    toggleSize: 18,
                    width: 40.0,
                    height: 17.0,
                    borderRadius: 30.0,
                    padding: 0,
                    showOnOff: false,
                    activeText: '',
                    inactiveText: '',
                  ),
                ],
              ),
              const SizedBox(height: 5),
              CommonTextWidget(
                text: homeDbCloudSBViewController.isAllData.value
                    ? homeDbCloudSBViewController.picturesList[index].name
                    : homeDbCloudSBViewController
                        .processedUnprocessedList[index].name,
                size: 10,
                color: AppColors.pink,
                fontFamily: AppFonts.poppinsLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
