import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/api_controller.dart';

import 'custom_text_widget.dart';

class CustomAPICategoryWidget extends StatelessWidget {
  const CustomAPICategoryWidget({
    super.key,
    required this.btnText,
    required this.categoryText,
    this.controller,
  });

  final String btnText;
  final String categoryText;
  final ApiController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () => controller?.showGetAllUsersScreen(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: CustomTextWidget(text: btnText)),
        CustomTextWidget(
          text: categoryText,
          color: Colors.black,
        ),
      ],
    );
  }
}
