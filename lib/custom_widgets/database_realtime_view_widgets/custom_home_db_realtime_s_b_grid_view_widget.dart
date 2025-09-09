import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../row_view_widgets/custom_realtime_row_view_widget.dart';

class CustomHomeDbRealtimeSBGridViewWidget extends StatelessWidget {
  const CustomHomeDbRealtimeSBGridViewWidget({
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
            print('ABC in connectionState condition');
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print('ABC in hasError');
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            print('ABC in has noData');
            return const Center(child: Text('No data found'));
          }

          print(
              'ABC before and pictureList is ${homeDbRealtimeSBViewController.picturesList.length}');

          // Only for initial data load (not every time)
          homeDbRealtimeSBViewController.getPicturesData(snapshot);

          print(
              'ABC called and pictureList is ${homeDbRealtimeSBViewController.picturesList.length}');
          return Obx(() => ListView.builder(
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
              ));
        },
      ),
    );
  }
}
