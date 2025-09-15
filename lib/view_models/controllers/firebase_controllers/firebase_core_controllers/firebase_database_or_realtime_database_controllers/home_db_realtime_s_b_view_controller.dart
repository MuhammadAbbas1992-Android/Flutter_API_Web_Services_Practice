import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../models/picture_model.dart';
import '../../../../../res/app_utils.dart';
import '../../../../../res/routs/rout_names.dart';
import '../../../../services/firebase_services/firebase_services.dart';

class HomeDbRealtimeSBViewController extends GetxController {
  RxBool isAllData = true.obs;
  RxList<PictureModel> picturesList = <PictureModel>[].obs;
  RxList<PictureModel> processedUnprocessedList = <PictureModel>[].obs;
  DatabaseReference? _dbRef;

  @override
  void onInit() {
    super.onInit();
    loadProductsDataPath();
  }

  // Expose the stream so UI can use it
  Stream<DatabaseEvent>? get dbRefStream => _dbRef?.onValue;

  void loadProductsDataPath() {
    picturesList.clear();
    AppUtils.picturesList.clear();
    final dbRef = FirebaseServices.getFirebaseDBPath();

    if (dbRef != null) {
      _dbRef = dbRef;

      // Listen for database changes incrementally
      _dbRef!.onChildAdded.listen((event) {
        final pictureModel = PictureModel.fromMap(
            Map<String, dynamic>.from(event.snapshot.value as Map));
        // Add only if not already present
        if (!picturesList.any((p) => p.id == pictureModel.id)) {
          picturesList.add(pictureModel);
          AppUtils.picturesList.add(pictureModel);
        }
      });

      _dbRef!.onChildChanged.listen((event) {
        final updatedModel = PictureModel.fromMap(
            Map<String, dynamic>.from(event.snapshot.value as Map));
        final index = picturesList.indexWhere((p) => p.id == updatedModel.id);
        if (index != -1) {
          picturesList[index] = updatedModel;
          AppUtils.picturesList[index] = updatedModel;
        }
      });

      _dbRef!.onChildRemoved.listen((event) {
        final removedId = event.snapshot.key;
        picturesList.removeWhere((p) => p.id == removedId);
        AppUtils.picturesList.removeWhere((p) => p.id == removedId);
      });
    }
  }

  // We no longer need to rebuild the whole list inside StreamBuilder
  void getPicturesData(AsyncSnapshot<DatabaseEvent> snapshot) {
    // Optional: Only used for initial snapshot if list is empty
    if (picturesList.isEmpty && snapshot.hasData) {
      for (var childSnapshot in snapshot.data!.snapshot.children) {
        final pictureModel = PictureModel.fromMap(
            Map<String, dynamic>.from(childSnapshot.value as Map));
        picturesList.add(pictureModel);
        AppUtils.picturesList.add(pictureModel);
      }
    }
  }

  Future<void> addPicture(PictureModel? model) async {
    bool response = await Get.toNamed(RoutNames.addImageView, arguments: model);
  }

  void toggle(bool value, int index) {
    if (isAllData.value) {
      picturesList[index].processed = value;
      picturesList.refresh();
    } else {
      processedUnprocessedList[index].processed = value;
      processedUnprocessedList.refresh();
    }
  }

  void selectAllPictures() {
    isAllData.value = true;
  }

  void selectUnprocessedPictures(int category) {
    isAllData.value = false;
    // isLoading.value = !isLoading.value;
    processedUnprocessedList.clear();

    switch (category) {
      case 0:
        for (var picture in picturesList) {
          int i = 0;
          if (picture.processed == true) {
            processedUnprocessedList.add(picture);
            print(processedUnprocessedList[i++].name);
            // picturesList.refresh();
          }
        }
        //Display message if picture list is not empty but no processed data
        if (picturesList.isNotEmpty && processedUnprocessedList.isEmpty) {
          AppUtils.mySnackBar(title: 'Message', message: 'No processed data');
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
        //Display message if picture list is not empty but no unprocessed data
        if (picturesList.isNotEmpty && processedUnprocessedList.isEmpty) {
          AppUtils.mySnackBar(title: 'Message', message: 'No unprocessed data');
        }
        break;
    }
    // isLoading.value = !isLoading.value;
  }

  Future<void> openFullPictureView(int id) async {
    bool response = await Get.toNamed(RoutNames.fullPictureView, arguments: id);
  }

  Future<void> deleteItem(int index) async {
    // isLoading.value = true;
    if (await FirebaseServices.deletePicture(index)) {
      // isLoading.value = false;
      AppUtils.mySnackBar(
          title: 'Message', message: 'Picture item deleted successfully');
    } else {
      // isLoading.value = false;
      AppUtils.mySnackBar(
          title: 'Error', message: 'Failed to delete picture item');
    }
  }
}
