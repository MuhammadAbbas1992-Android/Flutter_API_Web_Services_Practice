import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_database_steam_builder_with_list_view_builder_view_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../common/common_text_widget.dart';
import '../res/constants/app_colors.dart';
import '../res/constants/app_fonts.dart';
import 'custom_dialog_box_widget.dart';

class CustomRowViewWidget extends StatelessWidget {
  const CustomRowViewWidget({
    super.key,
    required this.index,
    required this.homeStreamAndListViewBuilderViewController,
  });

  final int index;
  final HomeStreamAndListViewBuilderViewController
      homeStreamAndListViewBuilderViewController;

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
                child: homeStreamAndListViewBuilderViewController
                        .isAllData.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () =>
                                homeStreamAndListViewBuilderViewController
                                    .addPicture(index),
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
                                await homeStreamAndListViewBuilderViewController
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
                  onTap: () => homeStreamAndListViewBuilderViewController
                      .openFullPictureView(index),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: homeStreamAndListViewBuilderViewController
                            .isAllData.value
                        ? CachedNetworkImage(
                            imageUrl: homeStreamAndListViewBuilderViewController
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
                            imageUrl: homeStreamAndListViewBuilderViewController
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
                    text: homeStreamAndListViewBuilderViewController
                            .isAllData.value
                        ? homeStreamAndListViewBuilderViewController
                                    .picturesList[index].processed ==
                                true
                            ? 'Processed'
                            : 'Unprocessed'
                        : homeStreamAndListViewBuilderViewController
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
                    value: homeStreamAndListViewBuilderViewController
                            .isAllData.value
                        ? homeStreamAndListViewBuilderViewController
                            .picturesList[index].processed!
                        : homeStreamAndListViewBuilderViewController
                            .processedUnprocessedList[index].processed!,
                    onToggle: (value) =>
                        homeStreamAndListViewBuilderViewController.toggle(
                            value, index),
                    activeColor: AppColors.lightPink,
                    inactiveColor: AppColors.mediumGrey,
                    toggleColor: homeStreamAndListViewBuilderViewController
                            .isAllData.value
                        ? homeStreamAndListViewBuilderViewController
                                    .picturesList[index].processed ==
                                true
                            ? AppColors.pink
                            : AppColors.lightGrey
                        : homeStreamAndListViewBuilderViewController
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
                text: homeStreamAndListViewBuilderViewController.isAllData.value
                    ? homeStreamAndListViewBuilderViewController
                        .picturesList[index].name
                    : homeStreamAndListViewBuilderViewController
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
