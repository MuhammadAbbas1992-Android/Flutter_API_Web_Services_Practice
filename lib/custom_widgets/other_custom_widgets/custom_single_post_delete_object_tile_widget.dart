import 'package:flutter/material.dart';

import '../../view_models/controllers/rest_apis_controllers/post_put_patch_delete_api_controller.dart';

class CustomSinglePostDeleteObjectTileWidget extends StatelessWidget {
  const CustomSinglePostDeleteObjectTileWidget(
      {super.key, required this.controller});

  final PostPutPatchDeleteApiController controller;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ListTile(
            leading: controller.postPutPatchResponse!.id.length > 3
                ? const Text('Done')
                : Text(controller.postPutPatchResponse!.id),
            title: controller.postPutPatchResponse?.createdAt != null
                ? Text(
                    '${controller.postPutPatchResponse!.name} ${controller.postPutPatchResponse!.createdAt}')
                : Text(
                    '${controller.postPutPatchResponse!.name} ${controller.postPutPatchResponse!.updatedAt}'),
            subtitle: controller.postPutPatchResponse!.data != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.postPutPatchResponse!.data!.entries
                        .where((entry) => entry.value != null)
                        .map((entry) => Text('${entry.key}: ${entry.value}'))
                        .toList(),
                  )
                : const Text('No data available'),
          ),
        ),
      ),
    );
  }
}
