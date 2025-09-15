import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../custom_widgets/database_realtime_view_widgets/custom_home_db_realtime_s_b_custom_view_widget.dart';
import '../../../../custom_widgets/other_custom_widgets/custom_category_widget.dart';
import '../../../../custom_widgets/other_custom_widgets/custom_header_widget.dart';
import '../../../../view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_db_realtime_s_b_view_controller.dart';

class HomeStreamBuilderLVBCustomView extends StatefulWidget {
  const HomeStreamBuilderLVBCustomView({super.key});

  @override
  State<HomeStreamBuilderLVBCustomView> createState() =>
      _HomeStreamBuilderLVBCustomViewState();
}

class _HomeStreamBuilderLVBCustomViewState
    extends State<HomeStreamBuilderLVBCustomView> {
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
          CustomHomeDbRealtimeSBCustomViewWidget(
              homeDbRealtimeSBViewController: homeDbRealtimeSBViewController)
        ],
      ),
    )));
  }
}
