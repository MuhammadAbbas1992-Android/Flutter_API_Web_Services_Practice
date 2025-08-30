import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/row_view_widgets/custom_realtime_row_view_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:get/get.dart';

import '../../common/common_text_widget.dart';
import '../../res/constants/app_colors.dart';

class CustomHomeDbRealtimeSBGridViewWidget extends StatelessWidget {
  const CustomHomeDbRealtimeSBGridViewWidget({
    super.key,
    required this.homeDbRealtimeSBViewController,
  });

  final HomeDbRealtimeSBViewController homeDbRealtimeSBViewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeDbRealtimeSBViewController.isLoading.value
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
          : Expanded(
              child: StreamBuilder<DatabaseEvent>(
                stream: homeDbRealtimeSBViewController
                    .dbRefStream, // Listens to changes in the 'users' node
                builder: (context, snapshot) {
                  // Error handling
                  if (snapshot.hasError) {
                    return Center(
                      child: CommonTextWidget(
                        text: 'Error: ${snapshot.error}',
                        color: AppColors.lightBlue,
                      ),
                    );
                  }
                  // If no data
                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.value == null) {
                    return const Center(
                      child: CommonTextWidget(
                        text: 'No data found',
                        color: AppColors.lightBlue,
                      ),
                    );
                  }
                  //called this method to load latest list of
                  homeDbRealtimeSBViewController.getPicturesData(snapshot);

                  print('ABC listview.builder() called');
                  // Building ListView
                  return ListView.builder(
                    itemCount: homeDbRealtimeSBViewController.isAllData.value
                        ? homeDbRealtimeSBViewController.picturesList.length
                        : homeDbRealtimeSBViewController
                            .processedUnprocessedList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CustomRealtimeRowViewWidget(
                          index: index,
                          homeDbRealtimeSBViewController:
                              homeDbRealtimeSBViewController,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
