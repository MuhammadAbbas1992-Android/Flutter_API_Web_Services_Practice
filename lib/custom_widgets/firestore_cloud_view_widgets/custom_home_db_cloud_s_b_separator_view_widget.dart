import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/row_view_widgets/custom_cloud_row_view_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_firestore_or_cloud_firestore_controllers/home_db_cloud_s_b_view_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../res/constants/app_colors.dart';

class CustomHomeDbCloudSBSeparatorViewWidget extends StatelessWidget {
  const CustomHomeDbCloudSBSeparatorViewWidget({
    super.key,
    required this.homeDbCloudSBViewController,
  });

  final HomeDbCloudSBViewController homeDbCloudSBViewController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: homeDbCloudSBViewController.collectionRef,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          // Only for initial data load (not every time)
          homeDbCloudSBViewController.getPicturesData(snapshot);

          return Obx(() => ListView.separated(
                itemCount: homeDbCloudSBViewController.isAllData.value
                    ? homeDbCloudSBViewController.picturesList.length
                    : homeDbCloudSBViewController
                        .processedUnprocessedList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: CustomCloudRowViewWidget(
                      index: index,
                      homeDbCloudSBViewController: homeDbCloudSBViewController,
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
