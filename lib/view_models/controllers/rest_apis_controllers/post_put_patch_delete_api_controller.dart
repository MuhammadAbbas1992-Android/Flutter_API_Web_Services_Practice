import 'package:get/get.dart';

import '../../../models/delete_response_model.dart';
import '../../../models/post_put_patch_object_response_model.dart';
import '../../../res/constants/app_constants.dart';
import '../../repositories/delete_repository.dart';
import '../../repositories/patch_repository.dart';
import '../../repositories/post_repository.dart';
import '../../repositories/put_repository.dart';

class PostPutPatchDeleteApiController extends GetxController {
  RxBool isLoading = false.obs;
  final _apiPost = PostRepository();
  final _apiPut = PutRepository();
  final _apiPatch = PatchRepository();
  final _apiDelete = DeleteRepository();
  PostPutPatchObjectResponseModel? postPutPatchResponse;
  DeleteResponseModel? deleteResponse;

  void postSingleModel() async {
    postPutPatchResponse = null;
    // Define request body
    final Map<String, dynamic> requestBody = {
      "name": "Apple MacBook Pro 18",
      "data": {
        "year": 2024,
        "price": 1849.99,
        "CPU model": "Intel Core i7",
        "Hard disk size": "1 TB"
      }
    };
    isLoading.value = true;
    await _apiPost.postSingleScreenRepository(requestBody).then((value) {
      isLoading.value = false;
      switch (AppConstants.caseNo) {
        case 11:
          postPutPatchResponse =
              PostPutPatchObjectResponseModel.fromJson(value);
          AppConstants.objectId = postPutPatchResponse!.id;
          break;
      }
      Get.snackbar('Success', 'Data posted Successfully');
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Get.snackbar('Error', error.toString());
      },
    );
  }

  void putSingleModel() async {
    postPutPatchResponse = null;
    // Define request body
    final Map<String, dynamic> requestBody = {
      "name": "Apple MacBook Pro 16 Updated",
      "data": {
        "year": 2025,
        "price": 1849.99,
        "CPU model": "Intel Core i7",
        "Hard disk size": "1 TB"
      }
    };
    isLoading.value = true;
    await _apiPut.putSingleScreenRepository(requestBody).then((value) {
      isLoading.value = false;
      switch (AppConstants.caseNo) {
        case 12:
          postPutPatchResponse =
              PostPutPatchObjectResponseModel.fromJson(value);
          break;
      }
      Get.snackbar('Success', 'Data updated Successfully');
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Get.snackbar('Error', error.toString());
      },
    );
  }

  void patchSingleModel() async {
    postPutPatchResponse = null;
    // Define request body
    final Map<String, dynamic> requestBody = {
      "name": "Apple MacBook Pro 16 Updated",
      "data": {"year": 2026, "Hard disk size": "2 TB"}
    };
    isLoading.value = true;
    await _apiPatch.patchSingleScreenRepository(requestBody).then((value) {
      isLoading.value = false;
      switch (AppConstants.caseNo) {
        case 13:
          postPutPatchResponse =
              PostPutPatchObjectResponseModel.fromJson(value);
          break;
      }
      Get.snackbar('Success', 'Data partially updated Successfully');
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Get.snackbar('Error', error.toString());
      },
    );
  }

  void deleteSingleModel() async {
    postPutPatchResponse = null;
    deleteResponse = null;
    isLoading.value = true;
    await _apiDelete.deleteSingleScreenRepository().then((value) {
      isLoading.value = false;
      switch (AppConstants.caseNo) {
        case 14:
          deleteResponse = DeleteResponseModel.fromJson(value);
          AppConstants.objectId = '';
          break;
      }
      Get.snackbar('Success', 'Data deleted successfully');
    }).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Get.snackbar('Error', error.toString());
      },
    );
  }
}
