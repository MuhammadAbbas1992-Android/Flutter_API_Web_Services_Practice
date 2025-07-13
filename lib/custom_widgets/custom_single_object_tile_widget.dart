import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/api_controller.dart';

import '../models/object_response_model.dart';

class CustomSingleObjectTileWidget extends StatelessWidget {
  const CustomSingleObjectTileWidget({super.key, required this.controller});

  final ApiController controller;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ListTile(
            leading: Text(controller.singleObject!.id),
            title: Text(controller.singleObject!.name),
            subtitle: controller.singleObject!.data != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.singleObject!.data!.entries
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
