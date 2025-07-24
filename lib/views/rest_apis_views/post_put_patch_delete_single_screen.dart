import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_single_post_delete_object_tile_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../custom_widgets/custom_text_widget.dart';
import '../../view_models/controllers/rest_apis_controllers/post_put_patch_delete_api_controller.dart';

class PostPutPatchDeleteSingleScreen extends StatefulWidget {
  const PostPutPatchDeleteSingleScreen({super.key});

  @override
  State<PostPutPatchDeleteSingleScreen> createState() =>
      _PostPutPatchDeleteSingleScreen();
}

class _PostPutPatchDeleteSingleScreen
    extends State<PostPutPatchDeleteSingleScreen> {
  final postPutPatchDeleteApiController =
      Get.find<PostPutPatchDeleteApiController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (AppConstants.caseNo) {
      case 11:
        postPutPatchDeleteApiController.postSingleModel();
        break;
      case 12:
        postPutPatchDeleteApiController.putSingleModel();
        break;
      case 13:
        postPutPatchDeleteApiController.patchSingleModel();
        break;
      case 14:
        postPutPatchDeleteApiController.deleteSingleModel();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Center(
                  child: CustomTextWidget(
                text: 'Post Put Patch Delete Single Object',
              )),
              backgroundColor: Colors.blue.shade500,
            ),
            body: Obx(() => postPutPatchDeleteApiController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : postPutPatchDeleteApiController.postPutPatchResponse != null
                    ? CustomSinglePostDeleteObjectTileWidget(
                        controller: postPutPatchDeleteApiController,
                      )
                    : postPutPatchDeleteApiController.deleteResponse != null
                        ? Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: postPutPatchDeleteApiController
                                          .deleteResponse?.message !=
                                      ''
                                  ? Text(
                                      '${postPutPatchDeleteApiController.deleteResponse!.message}')
                                  : Text(
                                      '${postPutPatchDeleteApiController.deleteResponse!.error}'),
                            ),
                          )
                        : const Center(child: Text('Error occurred')))));
  }
}
