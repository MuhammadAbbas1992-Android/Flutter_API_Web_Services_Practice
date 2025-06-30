import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_list_tile_widget.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/get_list_users_controller.dart';
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
  final controller = Get.put(GetListUsersController());
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
            body: Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(children: [
                    controller.userList.isNotEmpty
                        ? Expanded(
                            child: CustomListTileWidget(
                              controller: controller,
                            ),
                          )
                        : const Center(child: Text('No filtered pet available'))
                  ]))));
  }
}
