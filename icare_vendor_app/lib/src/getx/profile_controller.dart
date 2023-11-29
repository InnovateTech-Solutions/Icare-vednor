import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final formkey = GlobalKey<FormState>();

  Future onEdit() async {
    if (formkey.currentState!.validate()) {
      Get.snackbar("Success", "Edit Successful",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.mainScaffoldBackgroundColor,
          backgroundColor: ColorConstants.snakbarColorsuccessful);
      Get.back();
    } else {
      Get.snackbar("ERROR", "Input is invild",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.mainScaffoldBackgroundColor,
          backgroundColor: ColorConstants.snakbarColorError);
    }
    return;
  }
}
