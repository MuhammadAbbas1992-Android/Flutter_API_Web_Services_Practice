import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../res/constants/app_colors.dart';
import '../row_view_widgets/custom_realtime_row_view_widget.dart';

class CustomHomeDbRealtimeSBSeparatorViewWidget extends StatelessWidget {
  const CustomHomeDbRealtimeSBSeparatorViewWidget({
    super.key,
    required this.homeDbRealtimeSBViewController,
  });

  final HomeDbRealtimeSBViewController homeDbRealtimeSBViewController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<DatabaseEvent>(
        stream: homeDbRealtimeSBViewController.dbRefStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const Center(child: Text('No data found'));
          }

          // Only for initial data load (not every time)
          homeDbRealtimeSBViewController.getPicturesData(snapshot);

          return Obx(() => ListView.separated(
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
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: AppColors.blue,
                  height: 10,
                  thickness: 10,
                ),
              ));
        },
      ),
    );
  }
}
