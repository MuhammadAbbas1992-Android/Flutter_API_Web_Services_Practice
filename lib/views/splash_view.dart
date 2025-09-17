import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/other_custom_widgets/custom_image_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/other_custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_fonts.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/splash_view_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewController splashViewController =
      Get.put(SplashViewController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashViewController.openDashboardView();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SplashViewController());
    return Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/app_logo.svg',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                CustomTextWidget(
                  text: 'REST APIs/Google Maps/Go Maps/Firebase',
                  fontFamily: AppFonts.poppinsSemiBold,
                )
              ],
            ),
          ),
        )));
  }
}
