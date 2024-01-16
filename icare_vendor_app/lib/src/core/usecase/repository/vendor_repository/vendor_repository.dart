// ignore_for_file: body_might_complete_normally_catch_error, unrelated_type_equality_checks, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/model/vendor_model.dart';
import 'package:icare_vendor_app/src/helpers/local_storage/shared_prefrencess.dart';
import 'package:image_picker/image_picker.dart';

class VendorRepository extends GetxController {
  static VendorRepository get instance => Get.find();

  final userController = Get.put(LocalUserController());

  final _db = FirebaseFirestore.instance;

  late VendorModel vendorModel;

  void setUserModel(VendorModel vendorModel) {
    this.vendorModel = vendorModel;
  }

  createUser(VendorModel vendorModel) {
    _db
        .collection("Vendors_Test")
        .add(vendorModel.tojson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppColor.mainScaffoldBackgroundColor,
            backgroundColor: AppColor.snakbarColorsuccessful))
        .catchError((error) {
      Get.snackbar(error.toString(), "Something went wrong , try agin",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColor.mainScaffoldBackgroundColor,
          backgroundColor: AppColor.snakbarColorError);
    });
  }

  Future<void> updateVendorRecord(VendorModel vendorModel) async {
    await _db
        .collection("Vendors_Test")
        .doc(vendorModel.id)
        .update(vendorModel.tojson());
  }

  Future<VendorModel> getVendorDetails(String email) async {
    final snapshot = await _db
        .collection("Vendors_Test")
        .where("email", isEqualTo: email)
        .get();
    final userdata =
        snapshot.docs.map((e) => VendorModel.fromSnapShot(e)).single;
    vendorModel = userdata;
    userController.saveUserInfo(vendorModel);
    return userdata;
  }

// to see if user is Exits to make google , Apple Authentication
  Future<bool> vendorExist(String email) async {
    try {
      CollectionReference users = _db.collection('Vendors_Test');

      QuerySnapshot userSnapshot =
          await users.where('Email', isEqualTo: email).get();

      return userSnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking user existence: $e');
      return false;
    }
  }

  getUserImageUrl() {
    if (vendorModel.businesImage == true) {
      return CircleAvatar(
          radius: 70.r, // Adjust the radius as needed
          backgroundImage: NetworkImage(vendorModel.businesImage));
    } else {
      return SvgPicture.asset(
        "assets/Profilepic.svg",
        width: 100.w,
        height: 100.h,
      );
    }
  }

  void addImage() {
    _db
        .collection("Vendors_Test")
        .where('Email', isEqualTo: vendorModel.email)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs.first;
        userDoc.reference.update({'Image': vendorModel.businesImage});
      }
    });
  }

  void pickUpImage() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 500.h,
      maxWidth: 500.w,
      imageQuality: 75,
    );
    if (file == null) return;
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child("images");

    Reference referenceImageToUpload = referenceDirImage.child(file.path);
    try {
      await referenceImageToUpload.putFile(File(file.path));

      vendorModel.businesImage = await referenceImageToUpload.getDownloadURL();

      addImage();
    } catch (error) {
      Text(error.toString());
    }
  }

  Future<bool> checkEmailExists(String email) async {
    bool exists = false;

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('User') // Replace with your actual collection name
          .where('Email', isEqualTo: email)
          .get();

      exists = querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking email existence: $e');
      rethrow;
    }

    return exists;
  }

  Future<VendorModel> getVendor(String email) async {
    final snapshot = await _db
        .collection("Vendors_Test")
        .where("email", isEqualTo: email)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final userdata =
          snapshot.docs.map((e) => VendorModel.fromSnapShot(e)).single;

      userController.saveUserInfo(userdata);

      return userdata;
    } else {
      throw Exception("Vendor not found for email: $email");
    }
  }
}
