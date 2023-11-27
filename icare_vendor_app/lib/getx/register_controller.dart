import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/constant/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  final formkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController vendorName = TextEditingController();
  final TextEditingController address = TextEditingController();
  TextEditingController filePathConttroler = TextEditingController();
  TextEditingController coordinatesController = TextEditingController();

  RxInt activeStep = 0.obs;
  StepperType stepperType = StepperType.horizontal;
  var selectedItem = "".obs;
  File? selectImage;
  final RxString filePath = "".obs;

  var maskFormatterPhone = MaskTextInputFormatter(
      mask: '### ### ####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var maskFormatterTime = MaskTextInputFormatter(
      mask: '##:##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

//validation
  validateEmail(String? email) {
    if (GetUtils.isEmail(email!)) {
      return null;
    }
    return 'Email is not vaild';
  }

  vaildatePassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      return 'Password is not vaild';
    }
    return null;
  }

  validateVendorName(String? userName) {
    if (GetUtils.isUsername(userName!)) {
      return null;
    }
    return 'UserName is not vaild';
  }

  vaildPhoneNumber(String? phoneNumber) {
    if (GetUtils.isPhoneNumber(phoneNumber!)) {
      return null;
    }
    return 'Phone Number is not vaild';
  }

//filepicker
  void filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      filePath.value = result.files.single.path!;
    }
  }

  //steps
  Future continued() async {
    activeStep < 3 ? activeStep += 1 : null;
  }

  cancel() {
    activeStep > 0 ? activeStep -= 1 : null;
  }

  Future onLogin() async {
    if (formkey.currentState!.validate()) {
      Get.snackbar("Success", "Login Successful",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.mainScaffoldBackgroundColor,
          backgroundColor: ColorConstants.snakbarColorsuccessful);
    } else {
      Get.snackbar("ERROR", "Email or Password is invild",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.mainScaffoldBackgroundColor,
          backgroundColor: ColorConstants.snakbarColorError);
    }
    return;
  }

//category
  void upDateSelectedItem(String value) {
    selectedItem.value = value;
  }

//imagePicker
  Future pickImage() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 50.h,
      maxWidth: 50.w,
      imageQuality: 75,
    );
    final imagPath = File(file!.path);
//////////////////////////////////
    // ignore: unnecessary_null_comparison
    if (file == null) return;
    selectImage = imagPath;
  }
}
