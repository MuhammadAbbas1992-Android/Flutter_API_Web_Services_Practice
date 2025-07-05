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
                //BaseURL 'https://reqres.in'
                case 1:
                  controller?.showGetAllDataScreen(1);
                  break;
                case 2:
                  controller?.showGetSingleDataScreen(2);
                  break;
                case 3:
                  controller?.showGetSingleDataNotFoundScreen(3);
                  break;
                case 4:
                  controller?.showGetAllSourceScreen(4);
                  break;
                case 5:
                  controller?.showGetSingleSourceScreen(5);
                  break;
                case 6:
                  controller?.showGetSingleSourceNotFoundScreen(6);
                  break;
                case 7:
                  controller?.showGetDelayedResponseScreen(7);
                  break;
                //BaseAPI 'https://api.restful-api.dev'
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
