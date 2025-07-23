import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.size,
    this.fontFamily,
  });

  final String text;
  final Color color;
  final double? size;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontFamily: fontFamily),
    );
  }
}
