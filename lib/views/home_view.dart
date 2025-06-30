import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/api_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../custom_widgets/custom_api_category_widget.dart';
import '../custom_widgets/custom_text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApiController());
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
                  btnText: 'GET',
                  categoryText: 'List Users',
                  controller: controller,
                ),
                const CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Single user',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Single user not found',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'List <resource>',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Single <resource>',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Single <resource> not found',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Create',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'PUT',
                  categoryText: 'Update',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'PATCH',
                  categoryText: 'Update',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'DELETE',
                  categoryText: 'Delete',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Register - successful',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Register - unsuccessful',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Login - successful',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Login - unsuccessful',
                ),
                const CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Delayed response',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
