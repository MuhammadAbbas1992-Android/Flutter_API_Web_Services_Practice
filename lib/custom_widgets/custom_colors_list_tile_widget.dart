import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/get_api_controller.dart';

class CustomColorsListTileWidget extends StatelessWidget {
  const CustomColorsListTileWidget({
    super.key,
    required this.controller,
  });
  final GetApiController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.colorList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(controller.colorList[index].id.toString()),
          title: Text(
              '${controller.colorList[index].name} ${controller.colorList[index].year}'),
          subtitle: Text(controller.colorList[index].pantoneValue),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Text(controller.colorList[index].color),
          ),
        );
      },
    );
  }
}
