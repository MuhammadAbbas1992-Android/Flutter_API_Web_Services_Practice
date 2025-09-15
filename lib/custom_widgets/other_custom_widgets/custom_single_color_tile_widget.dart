import 'package:flutter/material.dart';

import '../../view_models/controllers/rest_apis_controllers/get_api_controller.dart';

class CustomSingleColorTileWidget extends StatelessWidget {
  const CustomSingleColorTileWidget({super.key, required this.controller});

  final GetApiController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(controller.singleColor!.id.toString()),
      title: Text(
          '${controller.singleColor?.name} ${controller.singleColor?.year}'),
      subtitle: Text(controller.singleColor!.pantoneValue),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Text(controller.singleColor!.color),
      ),
    );
  }
}
