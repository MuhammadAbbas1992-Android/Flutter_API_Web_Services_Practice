import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/home_view_controller.dart';

import 'custom_text_widget.dart';

class CustomAPICategoryWidget extends StatelessWidget {
  const CustomAPICategoryWidget({
    super.key,
    required this.caseNo,
    required this.btnText,
    required this.categoryText,
    this.controller,
  });

  final int caseNo;
  final String btnText;
  final String categoryText;
  final HomeViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              switch (caseNo) {
                case 1:
                  controller?.showGetAllUsersScreen(1);
                  break;
                case 2:
                  controller?.showGetSingleUserScreen(2);
                  break;
                case 3:
                  controller?.showGetSingleUserScreen(3);
                  break;
                case 4:
                  controller?.showGetAllUsersScreen(4);
                  break;
                case 5:
                  controller?.showGetSingleUserScreen(5);
                  break;
              }
            },
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
