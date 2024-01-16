import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_pdf.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends GetxController {
  static AddImage get instance => Get.find();

  final picker = ImagePicker();
  Rx<String?> imagePath = Rx<String?>(null);
  RxBool isImage = false.obs;

  void setImage(String newImage) {
    imagePath.value = newImage;
  }

  pickImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }

    Reference storageReference = FirebaseStorage.instance.ref().child('images');
    await storageReference.putFile(File(file.path));

    String imageUrl = await storageReference.getDownloadURL();
    setImage(imageUrl);
    print(imageUrl);
    update();
  }

  imageExpanded() {
    isImage.value = !isImage.value;
    if (AddPdf.instance.isFile.value == true) {
      AddPdf.instance.isFile.value = false;
    }
  }
}
