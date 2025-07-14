import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/get_api_controller.dart';

class CustomUsersListTileWidget extends StatelessWidget {
  const CustomUsersListTileWidget({
    super.key,
    required this.controller,
  });
  final GetApiController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.userList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(controller.userList[index].id.toString()),
          title: Text(
              '${controller.userList[index].firstName} ${controller.userList[index].lastName}'),
          subtitle: Text(controller.userList[index].email),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              width: 100,
              height: 100,
              controller.userList[index].avatar,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
