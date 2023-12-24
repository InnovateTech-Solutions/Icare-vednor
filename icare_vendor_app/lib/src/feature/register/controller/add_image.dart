import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends GetxController {
  static AddImage get instance => Get.find();
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _captionController = TextEditingController();

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      update();
    }
  }

  Future<void> uploadImage() async {
    if (_image == null) return;

    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child("images/vendorImages/${DateTime.now()}.jpg");
    UploadTask uploadTask = storageReference.putFile(_image!);
    await uploadTask.whenComplete(() => null);

    String imageUrl = await storageReference.getDownloadURL();

    // Save image details to Firebase Database
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("images").add({
      "userId": user?.uid,
      "imageUrl": imageUrl,
      "caption": _captionController.text,
      "timestamp": FieldValue.serverTimestamp(),
    });

    // Reset form
    _image = null;
    _captionController.clear();
    update();
  }
}
