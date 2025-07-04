import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_list_tile_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_tile_widget.dart';
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
    apiController.getSingleUser();
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
                : apiController.singleUser != null
                    ? CustomTileWidget(controller: apiController)
                    : const Center(child: Text('No user data available')))));
  }
}
