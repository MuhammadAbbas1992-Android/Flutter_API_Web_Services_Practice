import 'dart:io';
import 'dart:math';

import 'package:flutter_api_web_services_practice/view_models/services/firebase_services/firebase_services_for_cloud_db.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../models/picture_model.dart';
import '../../../../res/app_utils.dart';
import '../../../services/firebase_services/firebase_services_for_realtime_db.dart';

class AddImageViewController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isImageSet = false.obs;
  RxString imageName = ''.obs;
  RxString imagePath = ''.obs;
  RxString imageUrl = ''.obs;
  late PictureModel? pictureModel;
  String firebaseDBType = '';

  AddImageViewController() {
    final args = Get.arguments;

    if (args != null && args is Map<String, dynamic>) {
      print('ABC arguments $args');
      // Extract model
      if (args['model'] != null && args['model'] is PictureModel) {
        pictureModel = args['model'] as PictureModel;
        imageUrl.value = pictureModel!.imageUrl;
        imageName.value = pictureModel!.name;
      } else {
        pictureModel = null;
      }

      // Extract extra arguments
      if (args.containsKey('realtimeDB')) {
        firebaseDBType = args['realtimeDB'];
        print('ABC FirebaseDB Type $firebaseDBType');
      }

      if (args.containsKey('cloudDB')) {
        firebaseDBType = args['cloudDB'];
        print('ABC FirebaseDB Type $firebaseDBType');
      }
    } else {
      pictureModel = null;
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
      File originalFile = File(image.path);
      int originalSize = await originalFile.length();

      late XFile? finalFile = XFile(originalFile.path);

      // ✅ Compress if size > 100KB
      if (originalSize > 100 * 1024) {
        finalFile = await compressImage(originalFile);
      }

      if (finalFile != null) {
        imagePath.value = finalFile.path;
        imageName.value = '${DateTime.now().millisecondsSinceEpoch}.jpg';
        isImageSet.value = true;
      } else {
        clearData();
        AppUtils.mySnackBar(
            title: 'Error',
            message:
                'Image size is large and image not compressed successfully. So try another image');
      }
    }
  }

  /// ✅ Helper function to compress the image
  Future<XFile?> compressImage(File file) async {
    final String targetPath = "${file.parent.path}.jpg";

    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70, // adjust compression quality (0-100)
    );
    return compressedFile;
  }

  //Firebase DB
  Future<void> addUpdatePictureModelOnRealtimeDb() async {
    isLoading.value = true;
    //Each time it will work as u choose a new image from gallery
    if (imagePath.value.isNotEmpty) {
      await FirebaseServicesForRealtimeDb.checkImageStatusOnFirebaseStorage(
              imagePath.value, imageUrl.value)
          .then((value) {
        if (value != null) {
          imageUrl.value = value;
          savePictureModelOnRealtimeDb();
        } else {
          isLoading.value = !isLoading.value;
        }
      });
    }
  }

  //Cloud DB
  Future<void> addUpdatePictureModelOnCloudDb() async {
    isLoading.value = true;
    //Each time it will work as u choose a new image from gallery
    if (imagePath.value.isNotEmpty) {
      await FirebaseServicesForCloudDb.checkImageStatusOnFirebaseStorage(
              imagePath.value, imageUrl.value)
          .then((value) {
        if (value != null) {
          print('ABC only picture uploaded');
          imageUrl.value = value;
          savePictureModelOnCloudDb();
        } else {
          isLoading.value = !isLoading.value;
        }
      });
    }
  }

//Firebase DB
  Future<void> savePictureModelOnRealtimeDb() async {
    if (pictureModel != null) {
      //Update PictureModel
      pictureModel!.imageUrl = imageUrl.value;
      pictureModel!.name = imageName.value;
      if (await FirebaseServicesForRealtimeDb.updatePicture(pictureModel!)) {
        isLoading.value = false;
        openHomeScreen();
        AppUtils.mySnackBar(
            title: 'Success', message: 'Picture Model updated successfully');
      } else {
        isLoading.value = false;
        AppUtils.mySnackBar(
            title: 'Error', message: 'Failed to update Picture Model');
      }
    } else {
      //Add new PictureModel
      PictureModel model = PictureModel(
          name: imageName.value, imageUrl: imageUrl.value, processed: false);
      if (await FirebaseServicesForCloudDb.addPicture(model)) {
        isLoading.value = false;
        openHomeScreen();
        AppUtils.mySnackBar(
            title: 'Success', message: 'Picture Model saved successfully');
      } else {
        isLoading.value = false;
        AppUtils.mySnackBar(
            title: 'Error', message: 'Failed to save Picture Model');
      }
    }
  }

  //Cloud DB
  Future<void> savePictureModelOnCloudDb() async {
    if (pictureModel != null) {
      //Update PictureModel
      pictureModel!.imageUrl = imageUrl.value;
      pictureModel!.name = imageName.value;
      if (await FirebaseServicesForCloudDb.updatePicture(pictureModel!)) {
        isLoading.value = false;
        openHomeScreen();
        AppUtils.mySnackBar(
            title: 'Success', message: 'Picture Model updated successfully');
      } else {
        isLoading.value = false;
        AppUtils.mySnackBar(
            title: 'Error', message: 'Failed to update Picture Model');
      }
    } else {
      //Add new PictureModel
      PictureModel model = PictureModel(
          name: imageName.value, imageUrl: imageUrl.value, processed: false);
      if (await FirebaseServicesForCloudDb.addPicture(model)) {
        isLoading.value = false;
        openHomeScreen();
        AppUtils.mySnackBar(
            title: 'Success', message: 'Picture Model saved successfully');
      } else {
        isLoading.value = false;
        AppUtils.mySnackBar(
            title: 'Error', message: 'Failed to save Picture Model');
      }
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
