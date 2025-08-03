import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_stream_builder_l_v_b_view_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../common/common_text_widget.dart';
import '../res/app_utils.dart';
import '../res/constants/app_colors.dart';
import 'custom_row_view_widget.dart';

class CustomDataWidget extends StatelessWidget {
  const CustomDataWidget({
    super.key,
    required this.homeStreamAndListViewBuilderViewController,
  });

  final HomeStreamBuilderLVBViewController
      homeStreamAndListViewBuilderViewController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: homeStreamAndListViewBuilderViewController.isLoading.value
              ? const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: CircularProgressIndicator(
                        color: AppColors.lightBlue,
                      ),
                    ),
                  ),
                )
              : homeStreamAndListViewBuilderViewController.picturesList.isEmpty
                  ? const Center(
                      child: CommonTextWidget(
                        text: 'No data found',
                        color: AppColors.lightBlue,
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 20,
                              mainAxisExtent: 250),
                      itemCount: homeStreamAndListViewBuilderViewController
                              .isAllData.value
                          ? homeStreamAndListViewBuilderViewController
                              .picturesList.length
                          : homeStreamAndListViewBuilderViewController
                              .processedUnprocessedList.length,
                      // itemCount: homeViewController.isAllData.value
                      //     ? AppUtils.picturesList.length
                      //     : AppUtils.processedUnprocessedList.length,
                      itemBuilder: (context, index) {
                        return CustomRowViewWidget(
                          index: index,
                          homeStreamAndListViewBuilderViewController:
                              homeStreamAndListViewBuilderViewController,
                        );
                      },
                    ),
        ));
  }
}
