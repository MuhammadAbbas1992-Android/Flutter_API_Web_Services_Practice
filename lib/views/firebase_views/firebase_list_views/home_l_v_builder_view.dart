import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_data_list_view_builder_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_stream_builder_l_v_b_view_controller.dart';
import 'package:get/get.dart';

import '../../../../custom_widgets/custom_category_widget.dart';
import '../../../../custom_widgets/custom_data_grid_view_builder_widget.dart';
import '../../../../custom_widgets/custom_header_widget.dart';

class HomeLVBuilderView extends StatefulWidget {
  const HomeLVBuilderView({super.key});

  @override
  State<HomeLVBuilderView> createState() => _HomeLVBuilderViewState();
}

class _HomeLVBuilderViewState extends State<HomeLVBuilderView> {
  late final HomeStreamBuilderLVBViewController
      homeStreamAndListViewBuilderViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeStreamAndListViewBuilderViewController =
        Get.put(HomeStreamBuilderLVBViewController());
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
            onTap: () =>
                homeStreamAndListViewBuilderViewController.addPicture(null),
          ),
          CustomCategoryWidget(
            homeStreamAndListViewBuilderViewController:
                homeStreamAndListViewBuilderViewController,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDataListViewBuilderWidget(
              homeStreamAndListViewBuilderViewController:
                  homeStreamAndListViewBuilderViewController)
        ],
      ),
    )));
  }
}
