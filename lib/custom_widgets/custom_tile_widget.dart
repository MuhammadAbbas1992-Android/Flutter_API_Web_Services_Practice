import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/api_controller.dart';

class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget({super.key, required this.controller});

  final ApiController controller;

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
