import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_single_color_tile_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_single_object_tile_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_users_list_tile_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_single_user_tile_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/get_api_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../custom_widgets/custom_text_widget.dart';

class GetSingleScreen extends StatefulWidget {
  const GetSingleScreen({super.key});

  @override
  State<GetSingleScreen> createState() => _GetSingleUser();
}

class _GetSingleUser extends State<GetSingleScreen> {
  final getApiController = Get.find<GetApiController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiController.getSingleModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Center(
                  child: CustomTextWidget(
                text: 'Get Single Model',
              )),
              backgroundColor: Colors.blue.shade500,
            ),
            body: Obx(() => getApiController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : getApiController.singleUser != null ||
                        getApiController.singleColor != null ||
                        getApiController.singleObject != null
                    ? AppConstants.caseNo == 2
                        ? CustomSingleUserTileWidget(
                            controller: getApiController)
                        : AppConstants.caseNo == 5
                            ? CustomSingleColorTileWidget(
                                controller: getApiController)
                            : AppConstants.caseNo == 10
                                ? CustomSingleObjectTileWidget(
                                    controller: getApiController)
                                : const Center(child: Text('No data found'))
                    : const Center(child: Text('No data available')))));
  }
}
