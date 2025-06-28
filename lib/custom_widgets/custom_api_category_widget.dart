import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class CustomAPICategoryWidget extends StatelessWidget {
  const CustomAPICategoryWidget({
    super.key,
    required this.btnText,
    required this.categoryText,
  });

  final String btnText;
  final String categoryText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {},
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
