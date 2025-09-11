import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/firebase_list_view_widgets/custom_data_grid_view_count_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_list_controllers/home_grid_view_controller.dart';
import 'package:get/get.dart';

class HomeGVCountView extends StatefulWidget {
  const HomeGVCountView({super.key});

  @override
  State<HomeGVCountView> createState() => _HomeGVCountViewState();
}

class _HomeGVCountViewState extends State<HomeGVCountView> {
  late final HomeGridViewController homeGridViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeGridViewController = Get.put(HomeGridViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? selectedValue;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          CustomDataGridViewCountWidget(
            homeGridViewController: homeGridViewController,
          )
        ],
      ),
    )));
  }
}
