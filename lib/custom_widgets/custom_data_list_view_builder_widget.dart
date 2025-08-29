import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../common/common_text_widget.dart';
import '../res/constants/app_colors.dart';
import '../view_models/controllers/firebase_controllers/firebase_list_controllers/home_list_view_controller.dart';
import 'row_view_widgets/custom_firebase_list_row_view_widget.dart';

class CustomDataListViewBuilderWidget extends StatelessWidget {
  const CustomDataListViewBuilderWidget({
    super.key,
    required this.homeListViewController,
  });

  final HomeListViewController homeListViewController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: homeListViewController.isLoading.value
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
              : homeListViewController.picturesList.isEmpty
                  ? const Center(
                      child: CommonTextWidget(
                        text: 'No data found',
                        color: AppColors.lightBlue,
                      ),
                    )
                  : ListView.builder(
                      itemCount: homeListViewController.isAllData.value
                          ? homeListViewController.picturesList.length
                          : homeListViewController
                              .processedUnprocessedList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: CustomFirebaseListRowViewWidget(
                            index: index,
                            homeListViewController: homeListViewController,
                          ),
                        );
                      },
                    ),
        ));
  }
}
