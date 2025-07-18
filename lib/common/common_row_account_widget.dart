import 'package:flutter/material.dart';

import '../res/constants/app_colors.dart';
import 'common_text_widget.dart';

class CommonRowAccountWidget extends StatelessWidget {
  const CommonRowAccountWidget(
      {super.key,
      required this.textMessage,
      required this.textScreen,
      required this.onTap});
  final String textMessage;
  final String textScreen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonTextWidget(
          text: textMessage,
          color: AppColors.mediumGrey,
        ),
        const SizedBox(
          width: 10.0,
        ),
        InkWell(
          onTap: onTap,
          child: CommonTextWidget(
            text: textScreen,
            color: AppColors.pink,
          ),
        )
      ],
    );
  }
}
