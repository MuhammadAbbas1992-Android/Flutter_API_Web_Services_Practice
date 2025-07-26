import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_database_steam_builder_with_list_view_builder_view_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../common/common_text_widget.dart';
import '../res/constants/app_colors.dart';
import '../res/constants/app_fonts.dart';

class CustomRowViewWidget extends StatelessWidget {
  const CustomRowViewWidget({
    super.key,
    required this.index,
    required this.homeDatabaseSteamBuilderWithListViewBuilderViewController,
  });

  final int index;
  final HomeDatabaseSteamBuilderWithListViewBuilderViewController
      homeDatabaseSteamBuilderWithListViewBuilderViewController;

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
              Row(
                children: [SvgPicture.string('assets/icons/ic_delete.svg')],
              ),
              InkWell(
                  onTap: () =>
                      homeDatabaseSteamBuilderWithListViewBuilderViewController
                          .openFullPictureView(index),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child:
                        homeDatabaseSteamBuilderWithListViewBuilderViewController
                                .isAllData.value
                            ? Image.network(
                                homeDatabaseSteamBuilderWithListViewBuilderViewController
                                    .picturesList[index].imageUrl,
                                fit: BoxFit.fill,
                                height: 155,
                                width: 156,
                              )
                            : Image.network(
                                homeDatabaseSteamBuilderWithListViewBuilderViewController
                                    .processedUnprocessedList[index].imageUrl,
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
                    text: homeDatabaseSteamBuilderWithListViewBuilderViewController
                            .isAllData.value
                        ? homeDatabaseSteamBuilderWithListViewBuilderViewController
                                    .picturesList[index].processed ==
                                true
                            ? 'Processed'
                            : 'Unprocessed'
                        : homeDatabaseSteamBuilderWithListViewBuilderViewController
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
                    value: homeDatabaseSteamBuilderWithListViewBuilderViewController
                            .isAllData.value
                        ? homeDatabaseSteamBuilderWithListViewBuilderViewController
                            .picturesList[index].processed!
                        : homeDatabaseSteamBuilderWithListViewBuilderViewController
                            .processedUnprocessedList[index].processed!,
                    onToggle: (value) =>
                        homeDatabaseSteamBuilderWithListViewBuilderViewController
                            .toggle(value, index),
                    activeColor: AppColors.lightPink,
                    inactiveColor: AppColors.mediumGrey,
                    toggleColor:
                        homeDatabaseSteamBuilderWithListViewBuilderViewController
                                .isAllData.value
                            ? homeDatabaseSteamBuilderWithListViewBuilderViewController
                                        .picturesList[index].processed ==
                                    true
                                ? AppColors.pink
                                : AppColors.lightGrey
                            : homeDatabaseSteamBuilderWithListViewBuilderViewController
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
                text: homeDatabaseSteamBuilderWithListViewBuilderViewController
                        .isAllData.value
                    ? homeDatabaseSteamBuilderWithListViewBuilderViewController
                        .picturesList[index].name
                    : homeDatabaseSteamBuilderWithListViewBuilderViewController
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
