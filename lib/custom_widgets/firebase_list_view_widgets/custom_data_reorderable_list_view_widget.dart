import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/row_view_widgets/custom_realtime_row_view_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_list_controllers/home_grid_view_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../common/common_text_widget.dart';
import '../../res/app_utils.dart';
import '../../res/constants/app_colors.dart';
import '../../view_models/controllers/firebase_controllers/firebase_list_controllers/home_list_view_controller.dart';
import '../row_view_widgets/custom_firebase_list_row_view_widget.dart';

class CustomDataReorderableListViewWidget extends StatelessWidget {
  const CustomDataReorderableListViewWidget({
    super.key,
    required this.homeGridViewController,
  });

  final HomeGridViewController homeGridViewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        /*ReorderableListView
      If you want to let users drag-and-drop reorder Firebase data*/
        child: ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            // update Countries order here
            homeGridViewController.reorderCountries(oldIndex, newIndex);
          },
          children: [
            for (final item in homeGridViewController.countries)
              ListTile(
                key: ValueKey(item),
                title: Text(item),
                leading: const Icon(Icons.drag_handle),
              ),
          ],
        ),
      ),
    );
  }
}
