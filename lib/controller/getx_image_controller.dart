import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var selectedImage = ''.obs;

  Future<void> pickImageGallary() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage.value = pickedImage.path;
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
        if(pickedImage != null){
          selectedImage.value = pickedImage.path;
        }
  }

  void clearImage(){
    selectedImage.value = '';
  }
}
