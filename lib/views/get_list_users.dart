import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_colors_list_tile_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_users_list_tile_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/api_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../custom_widgets/custom_text_widget.dart';

class GetListUsers extends StatefulWidget {
  const GetListUsers({super.key});

  @override
  State<GetListUsers> createState() => _GetListUsersState();
}

class _GetListUsersState extends State<GetListUsers> {
  final apiController = Get.find<ApiController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiController.getAllList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Center(
                  child: CustomTextWidget(
                text: 'Get All Users',
              )),
              backgroundColor: Colors.blue.shade500,
            ),
            body: Obx(() => apiController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : apiController.userList.isNotEmpty ||
                        apiController.colorList.isNotEmpty
                    ? Column(children: [
                        Expanded(
                          child: AppConstants.caseNo == 1
                              ? CustomUsersListTileWidget(
                                  controller: apiController,
                                )
                              : CustomColorsListTileWidget(
                                  controller: apiController,
                                ),
                        )
                      ])
                    : const Center(child: Text('No data found')))));
  }
}
