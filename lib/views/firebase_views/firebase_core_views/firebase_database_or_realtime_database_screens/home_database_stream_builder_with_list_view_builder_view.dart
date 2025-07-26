import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_core_controllers/firebase_database_or_realtime_database_controllers/home_database_steam_builder_with_list_view_builder_view_controller.dart';
import 'package:get/get.dart';

import '../../../../custom_widgets/custom_category_widget.dart';
import '../../../../custom_widgets/custom_data_widget.dart';
import '../../../../custom_widgets/custom_header_widget.dart';

class HomeDatabaseStreamBuilderWithListViewBuilderView extends StatefulWidget {
  const HomeDatabaseStreamBuilderWithListViewBuilderView({super.key});

  @override
  State<HomeDatabaseStreamBuilderWithListViewBuilderView> createState() =>
      _HomeDatabaseStreamBuilderWithListViewBuilderViewState();
}

class _HomeDatabaseStreamBuilderWithListViewBuilderViewState
    extends State<HomeDatabaseStreamBuilderWithListViewBuilderView> {
  late final HomeDatabaseSteamBuilderWithListViewBuilderViewController
      homeDatabaseSteamBuilderWithListViewBuilderViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeDatabaseSteamBuilderWithListViewBuilderViewController =
        Get.put(HomeDatabaseSteamBuilderWithListViewBuilderViewController());
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
                homeDatabaseSteamBuilderWithListViewBuilderViewController
                    .addPicture(),
          ),
          CustomCategoryWidget(
            homeDatabaseSteamBuilderWithListViewBuilderViewController:
                homeDatabaseSteamBuilderWithListViewBuilderViewController,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDataWidget(
              homeDatabaseSteamBuilderWithListViewBuilderViewController:
                  homeDatabaseSteamBuilderWithListViewBuilderViewController)
        ],
      ),
    )));
  }
}
