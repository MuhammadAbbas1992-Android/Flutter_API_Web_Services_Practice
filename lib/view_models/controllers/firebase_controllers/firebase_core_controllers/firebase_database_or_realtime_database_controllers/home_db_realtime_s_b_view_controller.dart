import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api_web_services_practice/view_models/services/firebase_services/firebase_services_stream_builder.dart';
import 'package:get/get.dart';

import '../../../../../models/picture_model.dart';
import '../../../../../res/app_utils.dart';
import '../../../../../res/routs/rout_names.dart';
import '../../../../services/firebase_services/firebase_services.dart';

class HomeDbRealtimeSBViewController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAllData = true.obs;
  RxBool isDatabaseAccessed = true.obs;
  RxList<PictureModel> picturesList = <PictureModel>[].obs;
  RxList<PictureModel> processedUnprocessedList = <PictureModel>[].obs;
  DatabaseReference? _dbRef;
  StreamSubscription<DatabaseEvent>? _dbListener;

  HomeDbRealtimeSBViewController() {
    loadProductsDataPath();
  }

  // Expose the stream so UI can use it
  Stream<DatabaseEvent>? get dbRefStream => _dbRef?.onValue;

  Future<void> loadProductsDataPath() async {
    isLoading.value = true;
    await FirebaseServicesStreamBuilder.getFirebaseDBPath().then(
      (value) {
        isLoading.value = false;
        if (value != null) {
          _dbRef = value;
          print('ABC Path loaded $_dbRef');
        }
      },
    ).onError(
      (error, stackTrace) {
        isLoading.value = false;
        AppUtils.mySnackBar(
            title: 'Error', message: 'Failed to get Firebase DB path');
      },
    );
  }

  void getPicturesData(AsyncSnapshot<DatabaseEvent> snapshot) {
    // Listen for writes/changes at root node
    _dbRef!.onChildAdded.listen((event) {
      isDatabaseAccessed.value = true;
      print("Child Added at root: ${event.snapshot.key}");
    });

    _dbRef!.onChildChanged.listen((event) {
      isDatabaseAccessed.value = true;
      print("Child Changed at root: ${event.snapshot.key}");
    });

    _dbRef!.onChildRemoved.listen((event) {
      isDatabaseAccessed.value = true;
      print("Child Removed at root: ${event.snapshot.key}");
    });
    if (isDatabaseAccessed.value) {
      if (snapshot.hasData) {
        picturesList.clear();
        AppUtils.picturesList.clear();
        for (var childSnapshot in snapshot.data!.snapshot.children) {
          final pictureModel = PictureModel.fromMap(
              Map<String, dynamic>.from(childSnapshot.value as Map));
          picturesList.add(pictureModel);
          AppUtils.picturesList = picturesList;
        }
      }
      isDatabaseAccessed.value = false;
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
      await loadProductsDataPath();
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
