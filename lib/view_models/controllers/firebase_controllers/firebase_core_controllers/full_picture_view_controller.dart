import 'package:get/get.dart';

class FullPictureViewController extends GetxController {
  late final int index;
  FullPictureViewController() {
    index = Get.arguments;
  }
  void backToHomeScreen() {
    Get.back(result: false);
  }
}
