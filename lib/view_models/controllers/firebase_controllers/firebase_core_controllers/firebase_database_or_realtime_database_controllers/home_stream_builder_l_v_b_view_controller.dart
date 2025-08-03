import 'dart:async';

import 'package:get/get.dart';

import '../../../../../models/picture_model.dart';
import '../../../../../res/app_utils.dart';
import '../../../../../res/routs/rout_names.dart';
import '../../../../services/firebase_services/firebase_services.dart';

class HomeStreamBuilderLVBViewController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAllData = true.obs;
  RxList<PictureModel> picturesList = <PictureModel>[].obs;
  RxList<PictureModel> processedUnprocessedList = <PictureModel>[].obs;

  HomeStreamBuilderLVBViewController() {
    loadProductsData();
  }

  Future<void> loadProductsData() async {
    isLoading.value = true;
    await FirebaseServices.getPictureData().then(
      (value) {
        isLoading.value = !isLoading.value;
        if (value != null) {
          AppUtils.picturesList.clear();
          AppUtils.picturesList = value;
          picturesList.clear();
          picturesList.value = value;
        }
      },
    ).onError(
      (error, stackTrace) {
        isLoading.value = !isLoading.value;
        AppUtils.mySnackBar(
            title: 'Error', message: 'Failed to load Pictures data');
      },
    );
  }

  Future<void> addPicture(int index) async {
    bool response = await Get.toNamed(RoutNames.addImageView, arguments: index);
    if (response) {
      loadProductsData();
    }
  }

  void toggle(bool value, int index) {
    if (isAllData.value) {
      picturesList[index].processed = value;
      picturesList.refresh();
    } else {
      processedUnprocessedList[index].processed = value;
      picturesList.refresh();
    }
  }

  void selectAllPictures() {
    isAllData.value = true;
  }

  void selectUnprocessedPictures(int category) {
    isAllData.value = false;
    isLoading.value = !isLoading.value;
    processedUnprocessedList.clear();

    switch (category) {
      case 0:
        for (var picture in picturesList) {
          int i = 0;
          if (picture.processed == true) {
            processedUnprocessedList.add(picture);
            print(processedUnprocessedList[i++].name);
            picturesList.refresh();
          }
        }
        break;
      case 1:
        for (var picture in picturesList) {
          int i = 0;
          if (picture.processed == false) {
            processedUnprocessedList.add(picture);
            print(processedUnprocessedList[i++].name);
          }
        }
        break;
    }
    isLoading.value = !isLoading.value;
  }

  Future<void> openFullPictureView(int id) async {
    bool response = await Get.toNamed(RoutNames.fullPictureView, arguments: id);
  }

  Future<void> deleteItem(int index) async {
    isLoading.value = true;
    if (await FirebaseServices.deletePicture(index)) {
      await loadProductsData();
      isLoading.value = false;
      AppUtils.mySnackBar(
          title: 'Message', message: 'Picture item deleted successfully');
    } else {
      isLoading.value = false;
      AppUtils.mySnackBar(
          title: 'Error', message: 'Failed to delete picture item');
    }
  }
}
