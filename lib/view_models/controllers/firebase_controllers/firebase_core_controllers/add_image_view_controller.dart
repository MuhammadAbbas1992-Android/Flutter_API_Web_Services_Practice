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

  Future<void> getImageFromGalleryOrCamera(bool isCameraImage) async {
    AppUtils.mySnackBar(title: 'Alert', message: 'Please choose an image');
    final ImagePicker picker = ImagePicker();
    final image;
    if (isCameraImage) {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      //Get String of Image File from Gallery or Camera
      imagePath.value = image.path;
      imageName.value = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      isImageSet.value = true;
    }
  }

  Future<void> addPicture() async {
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
      });
    } else {
      saveMedicine();
    }
  }

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
