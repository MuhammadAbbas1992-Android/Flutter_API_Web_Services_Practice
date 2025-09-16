import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';

import '../../../models/picture_model.dart';
import '../../../res/app_utils.dart';

class FirebaseServicesForCloudDb {
  // Get Firestore collection reference for StreamBuilder
  static CollectionReference<Map<String, dynamic>>?
      getFirestoreCollectionRef() {
    try {
      final CollectionReference<Map<String, dynamic>> collectionReference =
          FirebaseFirestore.instance
              .collection(AppConstants.firestoreReferenceName);
      return collectionReference;
    } catch (e) {
      return null;
    }
  }

  // Add a new Picture item into Firestore or on Cloud database
  static Future<bool> addPicture(PictureModel pictureModel) async {
    try {
      final collectionRef = FirebaseFirestore.instance
          .collection(AppConstants.firestoreReferenceName);

      // Create a new document with auto-generated ID
      final docRef = collectionRef.doc();
      pictureModel.id = docRef.id; // assign generated ID
      await docRef.set(pictureModel.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  // Update Picture item into Firebase
  static Future<bool> updatePicture(PictureModel pictureModel) async {
    final CollectionReference<Map<String, dynamic>> collectionRef =
        FirebaseFirestore.instance
            .collection(AppConstants.firestoreReferenceName);
    try {
      // Update document by id
      await collectionRef.doc(pictureModel.id).update(pictureModel.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  //Upload Image on Firebase Storage
  static Future<String?> checkImageStatusOnFirebaseStorage(
      String imagePath, String imageUrl) async {
    //Replace with new image , need to delete old image
    if (imageUrl.isNotEmpty) {
      if (await _deleteImage(imageUrl)) {
        String? url = await _uploadImageOnFirebaseStorage(imagePath);
        if (url != null) {
          return url;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } else {
      String? url = await _uploadImageOnFirebaseStorage(imagePath);
      if (url != null) {
        return url;
      } else {
        return null;
      }
    }
  }

  // Delete Picture item from Firebase
  static Future<bool> deletePicture(int index) async {
    String imageUrl = AppUtils.picturesList[index].imageUrl;
    if (imageUrl.isNotEmpty) {
      _deleteImage(imageUrl);
    }
    final CollectionReference<Map<String, dynamic>> collectionRef =
        FirebaseFirestore.instance
            .collection(AppConstants.firestoreReferenceName);
    try {
      // Delete document by id
      await collectionRef.doc(AppUtils.picturesList[index].id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> _uploadImageOnFirebaseStorage(String imagePath) async {
    try {
      // Create a new reference to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child(
          '${AppConstants.firebaseDBName}/Images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Upload the image file
      await storageRef
          .putFile(File(imagePath))
          .timeout(const Duration(seconds: 30));

      String imageUrl = await storageRef
          .getDownloadURL()
          .timeout(const Duration(seconds: 30));

      return imageUrl;
    } on TimeoutException catch (_) {
      AppUtils.mySnackBar(
          title: 'Exception', message: 'Much time taken to upload image');
      return null;
    } catch (e) {
      AppUtils.mySnackBar(
          title: 'Exception', message: 'Failed to upload image');
      return null;
    }
  }

  // Delete Picture image from Firebase Storage
  static Future<bool> _deleteImage(String imageUrl) async {
    try {
      // Extract the reference path from the URL
      Reference ref = FirebaseStorage.instance.refFromURL(imageUrl);

      // Delete the file with a 20-second timeout
      await ref.delete().timeout(const Duration(seconds: 30));
      return true;
    } on TimeoutException catch (_) {
      AppUtils.mySnackBar(
          title: 'Exception',
          message: 'Much time taken to delete Previous image');
      return false;
    } catch (e) {
      AppUtils.mySnackBar(
          title: 'Exception', message: 'Error deleting image: $e');
      return false;
    }
  }
}
