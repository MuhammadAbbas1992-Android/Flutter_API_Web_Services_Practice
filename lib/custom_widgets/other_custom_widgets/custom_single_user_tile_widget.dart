import 'package:flutter/material.dart';

import '../../view_models/controllers/rest_apis_controllers/get_api_controller.dart';

class CustomSingleUserTileWidget extends StatelessWidget {
  const CustomSingleUserTileWidget({super.key, required this.controller});

  final GetApiController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(controller.singleUser!.id.toString()),
      title: Text(
          '${controller.singleUser?.firstName} ${controller.singleUser?.lastName}'),
      subtitle: Text(controller.singleUser!.email),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          width: 100,
          height: 100,
          controller.singleUser!.avatar,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
