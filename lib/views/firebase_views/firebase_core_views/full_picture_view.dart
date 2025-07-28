import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common_text_widget.dart';
import '../../../custom_widgets/custom_header_widget.dart';
import '../../../res/app_utils.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/constants/app_fonts.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_core_controllers/full_picture_view_controller.dart';

class FullPictureView extends StatefulWidget {
  const FullPictureView({super.key});

  @override
  State<FullPictureView> createState() => _FullPictureViewState();
}

class _FullPictureViewState extends State<FullPictureView> {
  late final FullPictureViewController fullPictureViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullPictureViewController = Get.put(FullPictureViewController());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: false);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            /*Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            AppUtils
                                .picturesList[fullPictureViewController.index]
                                .imageUrl,
                            scale: double.infinity)))),*/
            CachedNetworkImage(
              imageUrl: AppUtils
                  .picturesList[fullPictureViewController.index].imageUrl,
              placeholder: (context, url) => const Center(
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonHeaderWidget(
                      logo: 'assets/images/logo.png',
                      icon: 'assets/icons/ic_close.svg',
                      onTap: () => fullPictureViewController.backToHomeScreen(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: Get.width * .65,
                        decoration: BoxDecoration(
                            color: AppColors.pink.withOpacity(.8),
                            borderRadius: BorderRadius.circular(11)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextWidget(
                              text: AppUtils
                                  .picturesList[fullPictureViewController.index]
                                  .name,
                              size: 10,
                              color: AppColors.white,
                              fontFamily: AppFonts.poppinsBold,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonTextWidget(
                                  text: 'Author ID:  ',
                                  size: 10,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.poppinsBold,
                                ),
                                CommonTextWidget(
                                  text: 'g.abbas1992@gmail.com',
                                  size: 10,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.poppinsRegular,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
