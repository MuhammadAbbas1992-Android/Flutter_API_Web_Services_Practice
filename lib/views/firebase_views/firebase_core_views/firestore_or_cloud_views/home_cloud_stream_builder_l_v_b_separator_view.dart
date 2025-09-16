import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/firestore_cloud_view_widgets/custom_home_db_cloud_s_b_separator_view_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_firestore_or_cloud_firestore_controllers/home_db_cloud_s_b_view_controller.dart';
import 'package:get/get.dart';

import '../../../../custom_widgets/other_custom_widgets/custom_category_widget.dart';
import '../../../../custom_widgets/other_custom_widgets/custom_header_widget.dart';

class HomeCloudStreamBuilderLVBSeparatorView extends StatefulWidget {
  const HomeCloudStreamBuilderLVBSeparatorView({super.key});

  @override
  State<HomeCloudStreamBuilderLVBSeparatorView> createState() =>
      _HomeCloudStreamBuilderLVBSeparatorViewState();
}

class _HomeCloudStreamBuilderLVBSeparatorViewState
    extends State<HomeCloudStreamBuilderLVBSeparatorView> {
  late final HomeDbCloudSBViewController homeDbCloudSBViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeDbCloudSBViewController = Get.put(HomeDbCloudSBViewController());
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
            onTap: () => homeDbCloudSBViewController.addPicture(null),
          ),
          CustomCategoryWidget(
            homeDbCloudSBViewController: homeDbCloudSBViewController,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomHomeDbCloudSBSeparatorViewWidget(
            homeDbCloudSBViewController: homeDbCloudSBViewController,
          )
        ],
      ),
    )));
  }
}
