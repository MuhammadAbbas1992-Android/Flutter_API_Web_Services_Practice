import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_single_color_tile_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_users_list_tile_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_single_user_tile_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/api_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../custom_widgets/custom_text_widget.dart';

class GetSingleUser extends StatefulWidget {
  const GetSingleUser({super.key});

  @override
  State<GetSingleUser> createState() => _GetSingleUser();
}

class _GetSingleUser extends State<GetSingleUser> {
  final apiController = Get.find<ApiController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiController.getSingleModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Center(
                  child: CustomTextWidget(
                text: 'Get Single User',
              )),
              backgroundColor: Colors.blue.shade500,
            ),
            body: Obx(() => apiController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : apiController.singleUser != null ||
                        apiController.singleColor != null
                    ? AppConstants.caseNo == 2
                        ? CustomSingleUserTileWidget(controller: apiController)
                        : CustomSingleColorTileWidget(controller: apiController)
                    : const Center(child: Text('No data found')))));
  }
}
