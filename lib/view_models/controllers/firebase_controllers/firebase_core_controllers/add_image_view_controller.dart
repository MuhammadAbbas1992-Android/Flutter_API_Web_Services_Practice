import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../models/picture_model.dart';
import '../../../../res/app_utils.dart';
import '../../../services/firebase_services/firebase_services.dart';

class AddImageViewController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isImageSet = false.obs;
  RxString imageName = ''.obs;
  RxString imagePath = ''.obs;
  RxString imageUrl = ''.obs;
  late int index;

  AddImageViewController() {
    index = Get.arguments as int;
    if (index > -1) {
      imageUrl.value = AppUtils.picturesList[index].imageUrl;
      imageName.value = AppUtils.picturesList[index].name;
    }
  }

  Future<void> getImageFromGalleryOrCamera(bool isCameraImage) async {
    AppUtils.mySnackBar(title: 'Alert', message: 'Please choose an image');
    final ImagePicker picker = ImagePicker();
    final XFile? image;
    if (isCameraImage) {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      //Get String of Image File from Gallery or Camera
      imagePath.value = image.path;
      print('ABC ${imagePath.value}');
      imageName.value = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      isImageSet.value = true;
    }
  }
  /* Future<void> getImageFromGalleryOrCamera(bool isCameraImage) async {
    AppUtils.mySnackBar(title: 'Alert', message: 'Please choose an image');
    final ImagePicker picker = ImagePicker();
    final XFile? image;
    if (isCameraImage) {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      */ /*File originalFile = File(image.path);
      int originalSize = await originalFile.length();

      print("📷 ABC Original Image Size: ${originalSize / 1024} KB");

      late XFile? finalFile = XFile(originalFile.path);

      // ✅ Compress if size > 100KB
      if (originalSize > 100 * 1024) {
        finalFile = await compressImage(originalFile);
      }
*/ /*
      // if (finalFile != null)
      // {
      //Get String of Image File from Gallery or Camera
      // imagePath.value = finalFile.path;
      imagePath.value = image.path;
      imageName.value = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      isImageSet.value = true;
    } else {
      clearData();
      AppUtils.mySnackBar(
          title: 'Error',
          message:
              'Image size is large and image not compressed successfully. So try another image');
    }
  }*/
  // }

  /*/// ✅ Helper function to compress the image
  Future<XFile?> compressImage(File file) async {
    final String targetPath = "${file.parent.path}.jpg";

    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70, // adjust compression quality (0-100)
    );

    */ /*print(
        "📉 ABC Compressed Image Size: ${(await compressedFile!.length()) / 1024} KB");*/ /*

    return compressedFile;
  }*/
  Future<void> addPicture() async {
    isLoading.value = !isLoading.value;
    //Each time it will work as u choose a new image from gallery
    if (imagePath.value.isNotEmpty) {
      await FirebaseServices.testUpload(imagePath.value, imageUrl.value)
          .then((value) {
        if (value != null) {
          imageUrl.value = value;
          saveMedicine();
        } else {
          isLoading.value = !isLoading.value;
          AppUtils.mySnackBar(
              title: 'Error', message: 'Failed to upload image');
        }
      });
    } else {
      saveMedicine();
    }
  }
  /*Future<void> addPicture() async {
    isLoading.value = !isLoading.value;
    //Each time it will work as u choose a new image from gallery
    if (imagePath.value.isNotEmpty) {
      await FirebaseServices.uploadImage(imagePath.value, imageUrl.value)
          .then((value) {
        if (value != null) {
          imageUrl.value = value;
          saveMedicine();
        } else {
          isLoading.value = !isLoading.value;
          AppUtils.mySnackBar(
              title: 'Error', message: 'Failed to upload image');
        }
      }).onError(
        (error, stackTrace) {
          isLoading.value = !isLoading.value;
          Get.snackbar('Error', error.toString());
        },
      );
    } else {
      saveMedicine();
    }
  }*/

  Future<void> saveMedicine() async {
    //Add new Pet
    PictureModel pictureModel = PictureModel(
        name: imageName.value, imageUrl: imageUrl.value, processed: false);

    if (await FirebaseServices.addPicture(pictureModel)) {
      isLoading.value = !isLoading.value;
      openHomeScreen();
      AppUtils.mySnackBar(
          title: 'Success', message: 'Picture added successfully');
    } else {
      isLoading.value = !isLoading.value;
      AppUtils.mySnackBar(title: 'Error', message: 'Picture not saved');
    }
  }

  void clearData() {
    imageName.value = '';
    imagePath.value = '';
    imageUrl.value = '';
  }

  void openHomeScreen() {
    clearData();
    Get.back(result: true);
  }

  void closeScreen() {
    clearData();
    Get.back(result: false);
  }
}
