import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/firebase_list_view_widgets/custom_data_list_wheel_scroll_view_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_list_controllers/home_grid_view_controller.dart';
import 'package:get/get.dart';

class HomeListWheelScrollView extends StatefulWidget {
  const HomeListWheelScrollView({super.key});

  @override
  State<HomeListWheelScrollView> createState() =>
      _HomeListWheelScrollViewState();
}

class _HomeListWheelScrollViewState extends State<HomeListWheelScrollView> {
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
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          CustomDataListWheelScrollViewWidget(
            homeGridViewController: homeGridViewController,
          )
        ],
      ),
    )));
  }
}
