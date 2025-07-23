import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../res/constants/app_fonts.dart';
import 'common_text_widget.dart';

class CustomHeaderWidget extends StatelessWidget {
  final double? size;
  final String headerText;
  const CustomHeaderWidget(
      {super.key, this.size = 16, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return CommonTextWidget(
      text: headerText,
      size: size,
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.poppinsRegular,
    );
  }
}
