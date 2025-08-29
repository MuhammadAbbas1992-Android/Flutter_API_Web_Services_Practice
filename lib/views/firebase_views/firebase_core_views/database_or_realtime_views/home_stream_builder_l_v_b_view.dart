import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/database_realtime_view_widgets/custom_home_db_realtime_s_b_grid_view_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';
import 'package:get/get.dart';

import '../../../../custom_widgets/custom_category_widget.dart';
import '../../../../custom_widgets/custom_data_grid_view_builder_widget.dart';
import '../../../../custom_widgets/custom_header_widget.dart';

class HomeStreamBuilderLVBView extends StatefulWidget {
  const HomeStreamBuilderLVBView({super.key});

  @override
  State<HomeStreamBuilderLVBView> createState() =>
      _HomeStreamBuilderLVBViewState();
}

class _HomeStreamBuilderLVBViewState extends State<HomeStreamBuilderLVBView> {
  late final HomeDbRealtimeSBViewController homeDbRealtimeSBViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeDbRealtimeSBViewController = Get.put(HomeDbRealtimeSBViewController());
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
          CommonHeaderWidget(
            logo: 'assets/images/logo.png',
            icon: 'assets/icons/ic_add.svg',
            onTap: () => homeDbRealtimeSBViewController.addPicture(null),
          ),
          CustomCategoryWidget(
            homeDbRealtimeSBViewController: homeDbRealtimeSBViewController,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomHomeDbRealtimeSBGridViewWidget(
              homeDbRealtimeSBViewController: homeDbRealtimeSBViewController)
        ],
      ),
    )));
  }
}
