import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/models/object_response_model.dart';

import '../view_models/controllers/rest_apis_controllers/get_api_controller.dart';

class CustomObjectListTileWidget extends StatelessWidget {
  const CustomObjectListTileWidget({
    super.key,
    required this.controller,
  });
  final GetApiController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.objectList.length,
      itemBuilder: (context, index) {
        ObjectResponseModel? object = controller.objectList[index];

        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: Text(object.id),
            title: Text(object.name),
            subtitle: object.data != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: object.data!.entries
                        .where((entry) => entry.value != null)
                        .map((entry) => Text('${entry.key}: ${entry.value}'))
                        .toList(),
                  )
                : const Text('No data available'),
          ),
        );
      },
    );
  }
}
