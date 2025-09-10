import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../custom_widgets/custom_category_widget.dart';
import '../../../../custom_widgets/custom_header_widget.dart';
import '../../../custom_widgets/firebase_list_view_widgets/custom_data_list_view_custom_widget.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_list_controllers/home_list_view_controller.dart';

class HomeLVCustomView extends StatefulWidget {
  const HomeLVCustomView({super.key});

  @override
  State<HomeLVCustomView> createState() => _HomeLVCustomViewState();
}

class _HomeLVCustomViewState extends State<HomeLVCustomView> {
  late final HomeListViewController homeListViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeListViewController = Get.put(HomeListViewController());
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
            onTap: () => homeListViewController.addPicture(null),
          ),
          CustomCategoryWidget(
            homeListViewController: homeListViewController,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDataListViewCustomWidget(
              homeListViewController: homeListViewController)
        ],
      ),
    )));
  }
}
