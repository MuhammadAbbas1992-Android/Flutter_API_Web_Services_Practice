import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/api_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/home_view_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../custom_widgets/custom_api_category_widget.dart';
import '../custom_widgets/custom_text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewController());
    final apiController = Get.put(ApiController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'APIs Integration',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CustomAPICategoryWidget(
                  caseNo: 1,
                  btnText: 'GET',
                  categoryText: 'List Users',
                  controller: controller,
                ),
                CustomAPICategoryWidget(
                  caseNo: 2,
                  btnText: 'GET',
                  categoryText: 'Single user',
                  controller: controller,
                ),
                CustomAPICategoryWidget(
                  caseNo: 3,
                  btnText: 'GET',
                  categoryText: 'Single user not found',
                  controller: controller,
                ),
                CustomAPICategoryWidget(
                  caseNo: 4,
                  btnText: 'GET',
                  categoryText: 'List <resource>',
                  controller: controller,
                ),
                CustomAPICategoryWidget(
                  caseNo: 5,
                  btnText: 'GET',
                  categoryText: 'Single <resource>',
                  controller: controller,
                ),
                CustomAPICategoryWidget(
                  caseNo: 6,
                  btnText: 'GET',
                  categoryText: 'Single <resource> not found',
                  controller: controller,
                ),
                CustomAPICategoryWidget(
                  caseNo: 7,
                  btnText: 'GET',
                  categoryText: 'Delayed response',
                  controller: controller,
                ),
                CustomAPICategoryWidget(
                  caseNo: 8,
                  btnText: 'GET',
                  categoryText: 'List of all objects',
                  controller: controller,
                ),
                CustomAPICategoryWidget(
                  caseNo: 9,
                  btnText: 'GET',
                  categoryText: 'List of objects by Ids',
                  controller: controller,
                ),
                CustomAPICategoryWidget(
                  caseNo: 10,
                  btnText: 'GET',
                  categoryText: 'Single object by Id',
                  controller: controller,
                ),
                const CustomAPICategoryWidget(
                  caseNo: 9,
                  btnText: 'PUT',
                  categoryText: 'Update',
                ),
                const CustomAPICategoryWidget(
                  caseNo: 10,
                  btnText: 'PATCH',
                  categoryText: 'Update',
                ),
                const CustomAPICategoryWidget(
                  caseNo: 11,
                  btnText: 'DELETE',
                  categoryText: 'Delete',
                ),
                const CustomAPICategoryWidget(
                  caseNo: 12,
                  btnText: 'POST',
                  categoryText: 'Register - successful',
                ),
                const CustomAPICategoryWidget(
                  caseNo: 13,
                  btnText: 'POST',
                  categoryText: 'Register - unsuccessful',
                ),
                const CustomAPICategoryWidget(
                  caseNo: 14,
                  btnText: 'POST',
                  categoryText: 'Login - successful',
                ),
                const CustomAPICategoryWidget(
                  caseNo: 15,
                  btnText: 'POST',
                  categoryText: 'Login - unsuccessful',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
