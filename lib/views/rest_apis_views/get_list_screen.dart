import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_colors_list_tile_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_object_list_tile_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_users_list_tile_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/rest_apis_controllers/get_api_controller.dart';
import 'package:get/get.dart';

import '../../custom_widgets/custom_text_widget.dart';

class GetListScreen extends StatefulWidget {
  const GetListScreen({super.key});

  @override
  State<GetListScreen> createState() => _GetListScreenState();
}

class _GetListScreenState extends State<GetListScreen> {
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
                          child: AppConstants.caseNo == 1
                              ? CustomUsersListTileWidget(
                                  controller: getApiController,
                                )
                              : AppConstants.caseNo == 4
                                  ? CustomColorsListTileWidget(
                                      controller: getApiController,
                                    )
                                  : AppConstants.caseNo == 8 ||
                                          AppConstants.caseNo == 9
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
