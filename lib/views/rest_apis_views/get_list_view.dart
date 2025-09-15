import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/rest_apis_controllers/get_api_controller.dart';
import 'package:get/get.dart';

import '../../custom_widgets/other_custom_widgets/custom_colors_list_tile_widget.dart';
import '../../custom_widgets/other_custom_widgets/custom_object_list_tile_widget.dart';
import '../../custom_widgets/other_custom_widgets/custom_text_widget.dart';
import '../../custom_widgets/other_custom_widgets/custom_users_list_tile_widget.dart';
import '../../res/app_utils.dart';

class GetListView extends StatefulWidget {
  const GetListView({super.key});

  @override
  State<GetListView> createState() => _GetListViewState();
}

class _GetListViewState extends State<GetListView> {
  final getApiController = Get.find<GetApiController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiController.getAllList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Center(
                  child: CustomTextWidget(
                text: 'Get All List',
              )),
              backgroundColor: Colors.blue.shade500,
            ),
            body: Obx(() => getApiController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : getApiController.userList.isNotEmpty ||
                        getApiController.colorList.isNotEmpty ||
                        getApiController.objectList.isNotEmpty
                    ? Column(children: [
                        Expanded(
                          child: AppUtils.caseNo == 1
                              ? CustomUsersListTileWidget(
                                  controller: getApiController,
                                )
                              : AppUtils.caseNo == 4
                                  ? CustomColorsListTileWidget(
                                      controller: getApiController,
                                    )
                                  : AppUtils.caseNo == 8 || AppUtils.caseNo == 9
                                      ? CustomObjectListTileWidget(
                                          controller: getApiController,
                                        )
                                      : const Center(
                                          child: Text('No data found')),
                        )
                      ])
                    : const Center(child: Text('No data available')))));
  }
}
