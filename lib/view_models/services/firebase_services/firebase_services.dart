import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';

import '../../../data/exceptions/app_exceptions.dart';
import '../../../models/picture_model.dart';
import '../../../res/app_utils.dart';

class FirebaseServices {
  // Add a new Picture items into Firebase
  static Future<bool> addPicture(PictureModel pictureModel) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    try {
      final pictureModelRef =
          databaseReference.child(AppConstants.firebaseDBName).push();
      pictureModel.id = pictureModelRef.key!;
      await pictureModelRef.set(pictureModel.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  // Retrieve all Picture items from Firebase
  static Future<List<PictureModel>?> getPictureData() async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    List<PictureModel> pictureList = <PictureModel>[];
    try {
      await databaseReference.child(AppConstants.firebaseDBName).get().then(
        (value) {
          if (value.exists) {
            for (var childSnapshot in value.children) {
              final pictureModel = PictureModel.fromMap(
                  Map<String, dynamic>.from(childSnapshot.value as Map));
              pictureList.add(pictureModel);
            }
          }
        },
      );
      return pictureList;
    } catch (e) {
      return null;
    }
  }

  // Update Picture item into Firebase
  static Future<bool> updatePicture(PictureModel pictureModel) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    try {
      await databaseReference
          .child(AppConstants.firebaseDBName)
          .child(pictureModel.id!)
          .update(pictureModel.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  // Delete Picture item from Firebase
  static Future<bool> deletePicture(int index) async {
    String imageUrl = AppUtils.picturesList[index].imageUrl;
    if (imageUrl.isNotEmpty) {
      _deleteImage(imageUrl);
    }
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    try {
      await databaseReference
          .child(AppConstants.firebaseDBName)
          .child(AppUtils.picturesList[index].id!)
          .remove();
      return true;
    } catch (e) {
      return false;
    }
  }

  //Upload Image on Firebase Storage
  static Future<String?> uploadImage(String imagePath, String imageUrl) async {
    //Replace with new image , need to delete old image
    /*if (imageUrl.isNotEmpty) {
      deleteImage(imageUrl);
    }*/
    try {
      // Create a new reference to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child(
          '${AppConstants.firebaseDBName}/Images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Upload the image file
      await storageRef.putFile(File(imagePath));
      // Get the download URL
      String imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> testUpload(String imagePath, String imageUrl) async {
    final ref = FirebaseStorage.instance.ref().child(
        '${AppConstants.firebaseDBName}/Images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    try {
      // Start upload
      final uploadTask = ref.putFile(File(imagePath));
      await uploadTask
          .whenComplete(() => print("ABC ✅ Upload Completed"))
          .timeout(const Duration(seconds: 10), onTimeout: () async {
        print("ABC Upload task took longer than 10 seconds.");
        uploadTask.cancel();
        throw TimeoutException("ABC Upload task took longer than 10 seconds.");
      });
      print("✅ Upload Completed Successfully");
    } on TimeoutException catch (e) {
      print("⏳ Timeout: $e");
      // Stop further processing
      return;
    } catch (e) {
      print("❌ Upload Failed: $e");
    }
  }

  /*static Future<String?> uploadImage(
      String imagePath, String oldImageUrl) async {
    try {
      // ✅ Ensure Firebase is initialized
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }

      // ✅ Ensure user is authenticated (anonymous sign-in)
      if (FirebaseAuth.instance.currentUser == null) {
        await FirebaseAuth.instance.signInAnonymously();
      }

      final ref = FirebaseStorage.instance.ref().child(
          '${AppConstants.firebaseDBName}/Images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      print("ABC 🚀 Upload started for: $imagePath");
      await ref.putFile(File(imagePath));
      String url = await ref.getDownloadURL();
      print("ABC ✅ Upload success: $url");

      return url;
    } on FirebaseException catch (e) {
      print("ABC 🔥 Firebase Storage Error: ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      print("ABC 🔥 General Upload Error: $e");
      return null;
    }
  }
*/
  //Upload Image on Firebase Storage
  /* static Future<dynamic> uploadImage(String imagePath, String oldImageUrl) async {
    // ✅ Ensure a Firebase user is signed in
    if (FirebaseAuth.instance.currentUser == null) {
      await FirebaseAuth.instance.signInAnonymously();
    }
    //Replace with new image , need to delete old image
    */ /* if (oldImageUrl.isNotEmpty) {
      _deleteImage(oldImageUrl);
    }*/ /*

    try {
      // Create a new reference to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child(
          '${AppConstants.firebaseDBName}/Images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Upload the image file
      await storageRef.putFile(File(imagePath));
      String imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      throw FirebaseRequestException('${e.code} - ${e.message}');
    } catch (e) {
      return null;
    }
  }*/

  // Delete Picture image from Firebase Storage
  static Future<bool> _deleteImage(String imageUrl) async {
    try {
      // Extract the reference path from the URL
      Reference ref = FirebaseStorage.instance.refFromURL(imageUrl);

      // Delete the file
      await ref.delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
