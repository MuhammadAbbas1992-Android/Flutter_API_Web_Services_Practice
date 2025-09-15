import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonHeaderWidget extends StatelessWidget {
  const CommonHeaderWidget({
    super.key,
    required this.logo,
    required this.icon,
    required this.onTap,
  });

  final String logo;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Image.asset(
        logo,
        height: 60,
      ),
      InkWell(onTap: onTap, child: SvgPicture.asset(icon))
    ]);
  }
}
