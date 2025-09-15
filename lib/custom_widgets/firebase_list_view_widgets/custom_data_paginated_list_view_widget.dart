import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/row_view_widgets/custom_realtime_row_view_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_list_controllers/home_grid_view_controller.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../common/common_text_widget.dart';
import '../../res/constants/app_colors.dart';
import '../../res/constants/app_fonts.dart';

class CustomDataPaginatedListViewWidget extends StatelessWidget {
  const CustomDataPaginatedListViewWidget({
    super.key,
    required this.homeGridViewController,
    required this.scrollController,
  });

  final HomeGridViewController homeGridViewController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        /*ReorderableListView
      If you want to let users drag-and-drop reorder Firebase data*/
        child: ListView.builder(
          controller: scrollController,
          itemCount:
              homeGridViewController.items.length + 1, // extra for loader
          itemBuilder: (context, index) {
            if (index < homeGridViewController.items.length) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      width: 1,
                      color: AppColors.blue,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: CachedNetworkImage(
                          imageUrl:
                              homeGridViewController.items[index].imageUrl,
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
                            text:
                                homeGridViewController.items[index].processed ==
                                        true
                                    ? 'Processed'
                                    : 'Unprocessed',
                            size: 11,
                            color: AppColors.black,
                            fontFamily: AppFonts.poppinsRegular,
                            textAlign: TextAlign.left,
                          ),
                          FlutterSwitch(
                            value:
                                homeGridViewController.items[index].processed!,
                            onToggle: (value) =>
                                homeGridViewController.toggle(value, index),
                            activeColor: AppColors.lightPink,
                            inactiveColor: AppColors.mediumGrey,
                            toggleColor:
                                homeGridViewController.items[index].processed ==
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
                        text: homeGridViewController.items[index].name,
                        size: 10,
                        color: AppColors.pink,
                        fontFamily: AppFonts.poppinsLight,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: homeGridViewController.isLoading.value
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox.shrink(),
              );
            }
          },
        ),
      ),
    );
  }
}
