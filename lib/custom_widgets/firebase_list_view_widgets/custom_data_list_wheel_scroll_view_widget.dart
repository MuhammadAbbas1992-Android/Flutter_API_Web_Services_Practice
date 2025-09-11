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

class CustomDataListWheelScrollViewWidget extends StatelessWidget {
  const CustomDataListWheelScrollViewWidget({
    super.key,
    required this.homeGridViewController,
  });

  final HomeGridViewController homeGridViewController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListWheelScrollView.useDelegate(
      itemExtent: 100, // max expected card height
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) {
          if (index < 0 || index >= homeGridViewController.countries.length) {
            return null;
          }
          return Card(
            child: Center(
              child: Text(
                homeGridViewController.countries[index],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    ));
  }
}
