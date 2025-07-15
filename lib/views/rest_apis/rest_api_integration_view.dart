import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/get_api_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/rest_api_integration_view_controller.dart';
import 'package:get/get.dart';

import '../../custom_widgets/rest_api_widget.dart';
import '../../custom_widgets/custom_text_widget.dart';
import '../../view_models/controllers/post_put_patch_delete_api_controller.dart';

class RestApiIntegrationView extends StatelessWidget {
  const RestApiIntegrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RestApiIntegrationViewController());
    final getApiController = Get.put(GetApiController());
    final postPutPatchDeleteApiController =
        Get.put(PostPutPatchDeleteApiController());
    AppConstants.objectId = '';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'REST APIs Integration',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                RestApiWidget(
                  caseNo: 1,
                  btnText: 'GET',
                  categoryText: 'List Users',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 2,
                  btnText: 'GET',
                  categoryText: 'Single user',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 3,
                  btnText: 'GET',
                  categoryText: 'Single user not found',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 4,
                  btnText: 'GET',
                  categoryText: 'List <resource>',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 5,
                  btnText: 'GET',
                  categoryText: 'Single <resource>',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 6,
                  btnText: 'GET',
                  categoryText: 'Single <resource> not found',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 7,
                  btnText: 'GET',
                  categoryText: 'Delayed response',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 8,
                  btnText: 'GET',
                  categoryText: 'List of all objects',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 9,
                  btnText: 'GET',
                  categoryText: 'List of objects by Ids',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 10,
                  btnText: 'GET',
                  categoryText: 'Single object by Id',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 11,
                  btnText: 'POST',
                  categoryText: 'Add object',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 12,
                  btnText: 'PUT',
                  categoryText: 'Update Object',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 13,
                  btnText: 'PATCH',
                  categoryText: 'Partially Update Object',
                  controller: controller,
                ),
                RestApiWidget(
                  caseNo: 14,
                  btnText: 'DELETE',
                  categoryText: 'Delete Object',
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
