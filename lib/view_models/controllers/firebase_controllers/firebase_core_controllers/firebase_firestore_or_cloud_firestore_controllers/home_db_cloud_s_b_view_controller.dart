import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api_web_services_practice/view_models/services/firebase_services/firebase_services_for_cloud_db.dart';
import 'package:get/get.dart';

import '../../../../../models/picture_model.dart';
import '../../../../../res/app_utils.dart';
import '../../../../../res/routs/rout_names.dart';

class HomeDbCloudSBViewController extends GetxController {
  RxBool isAllData = true.obs;
  RxList<PictureModel> picturesList = <PictureModel>[].obs;
  RxList<PictureModel> processedUnprocessedList = <PictureModel>[].obs;
  CollectionReference<Map<String, dynamic>>? _collectionRef;

  @override
  void onInit() {
    super.onInit();
    loadProductsDataPath();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? get collectionRef =>
      _collectionRef?.snapshots();

  void loadProductsDataPath() {
    picturesList.clear();
    AppUtils.picturesList.clear();
    final collectionRef =
        FirebaseServicesForCloudDb.getFirestoreCollectionRef();

    if (collectionRef != null) {
      _collectionRef = collectionRef;
      // Listen for firestore or Cloud DB changes incrementally, modified or removed
      _collectionRef!.snapshots().listen((snapshot) {
        for (var change in snapshot.docChanges) {
          final data = change.doc.data() as Map<String, dynamic>;
          final pictureModel = PictureModel.fromMap(data)..id = change.doc.id;

          if (change.type == DocumentChangeType.added) {
            if (!picturesList.any((p) => p.id == pictureModel.id)) {
              picturesList.add(pictureModel);
              AppUtils.picturesList.add(pictureModel);
            }
          } else if (change.type == DocumentChangeType.modified) {
            final index =
                picturesList.indexWhere((p) => p.id == pictureModel.id);
            if (index != -1) {
              picturesList[index] = pictureModel;
              AppUtils.picturesList[index] = pictureModel;
            }
          } else if (change.type == DocumentChangeType.removed) {
            picturesList.removeWhere((p) => p.id == pictureModel.id);
            AppUtils.picturesList.removeWhere((p) => p.id == pictureModel.id);
          }
        }
      });
    }
  }

  // We no longer need to rebuild the whole list inside StreamBuilder
  void getPicturesData(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    // Optional: Only used for initial snapshot if list is empty
    if (picturesList.isEmpty && snapshot.hasData) {
      for (var childSnapshot in snapshot.data!.docs) {
        final pictureModel = PictureModel.fromMap(
            Map<String, dynamic>.from(childSnapshot as Map));
        picturesList.add(pictureModel);
        AppUtils.picturesList.add(pictureModel);
      }
    }
  }

  Future<void> addPicture(PictureModel? model) async {
    bool response = await Get.toNamed(RoutNames.addImageView, arguments: {
      'model': model,
      'cloudDB': 'cloudDB',
    });
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
  }

  Future<void> openFullPictureView(int id) async {
    bool response = await Get.toNamed(RoutNames.fullPictureView, arguments: id);
  }

  Future<void> deleteItem(int index) async {
    // isLoading.value = true;
    if (await FirebaseServicesForCloudDb.deletePicture(index)) {
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
