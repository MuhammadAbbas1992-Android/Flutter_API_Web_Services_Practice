import 'package:flutter/material.dart';

import '../res/constants/app_colors.dart';
import 'common_text_widget.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 48.0,
    this.size = 16.0,
    this.onTap,
  });
  final String text;
  final double width;
  final double height;
  final double size;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
              Size(width, height)), // Set custom height
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.pink),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          )),
      onPressed: onTap,
      child: CommonTextWidget(text: text, color: AppColors.white, size: size),
    );
  }
}
