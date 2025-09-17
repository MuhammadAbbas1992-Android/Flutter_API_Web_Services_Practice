import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.size,
    this.fontFamily,
    this.textAlign,
  });

  final String text;
  final Color color;
  final double? size;
  final String? fontFamily;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: size, fontFamily: fontFamily),
    );
  }
}
