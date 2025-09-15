import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widgets/other_custom_widgets/custom_text_widget.dart';
import '../../custom_widgets/rest_api_widgets/rest_api_widget.dart';
import '../../res/app_utils.dart';
import '../../view_models/controllers/rest_apis_controllers/get_api_controller.dart';
import '../../view_models/controllers/rest_apis_controllers/post_put_patch_delete_api_controller.dart';
import '../../view_models/controllers/rest_apis_controllers/rest_api_integration_view_controller.dart';

class RestApiIntegrationView extends StatefulWidget {
  const RestApiIntegrationView({super.key});

  @override
  State<RestApiIntegrationView> createState() => _RestApiIntegrationViewState();
}

class _RestApiIntegrationViewState extends State<RestApiIntegrationView> {
  late final RestApiIntegrationViewController restApiIntegrationController;
  late final GetApiController getApiController;
  late final PostPutPatchDeleteApiController postPutPatchDeleteApiController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    restApiIntegrationController = Get.put(RestApiIntegrationViewController());
    getApiController = Get.put(GetApiController());
    postPutPatchDeleteApiController =
        Get.put(PostPutPatchDeleteApiController());
    AppUtils.objectId = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    restApiIntegrationController.dispose();
    getApiController.dispose();
    postPutPatchDeleteApiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 2,
                  btnText: 'GET',
                  categoryText: 'Single user',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 3,
                  btnText: 'GET',
                  categoryText: 'Single user not found',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 4,
                  btnText: 'GET',
                  categoryText: 'List <resource>',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 5,
                  btnText: 'GET',
                  categoryText: 'Single <resource>',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 6,
                  btnText: 'GET',
                  categoryText: 'Single <resource> not found',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 7,
                  btnText: 'GET',
                  categoryText: 'Delayed response',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 8,
                  btnText: 'GET',
                  categoryText: 'List of all objects',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 9,
                  btnText: 'GET',
                  categoryText: 'List of objects by Ids',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 10,
                  btnText: 'GET',
                  categoryText: 'Single object by Id',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 11,
                  btnText: 'POST',
                  categoryText: 'Add object',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 12,
                  btnText: 'PUT',
                  categoryText: 'Update Object',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 13,
                  btnText: 'PATCH',
                  categoryText: 'Partially Update Object',
                  controller: restApiIntegrationController,
                ),
                RestApiWidget(
                  caseNo: 14,
                  btnText: 'DELETE',
                  categoryText: 'Delete Object',
                  controller: restApiIntegrationController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
