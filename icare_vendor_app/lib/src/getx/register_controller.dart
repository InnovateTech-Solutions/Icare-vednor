import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/model/vendor_model.dart';
import 'package:icare_vendor_app/src/repository/authentication/authentication_repository.dart';
import 'package:icare_vendor_app/src/repository/vendor_repository/vendor_repository.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../constant/color.dart';
import '../widget/constant_widget/const_wiidget/constant_widget.dart';
import '../../test/home_page.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  final profileFormkey = GlobalKey<FormState>();
  final personalFormkey = GlobalKey<FormState>();
  final contactlFormkey = GlobalKey<FormState>();
  final workingFormkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController vendorName = TextEditingController();
  final TextEditingController address = TextEditingController();
  TextEditingController operHour = TextEditingController();
  final TextEditingController closeHour = TextEditingController();
  final TextEditingController filePathController = TextEditingController();
  final TextEditingController description = TextEditingController();

  RxInt activeStep = 0.obs;
  StepperType stepperType = StepperType.horizontal;
  RxString selectedItem = "".obs;
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
    return 'Vendor is not vaild';
  }

  validateAddress() {
    if (address.text != "") {
      return null;
    }
    return 'Address is not vaild';
  }

  validateDescription() {
    if (description.text.isNotEmpty) {
      return null;
    }
    return 'Description is not vaild';
  }

  validateLicense(String? filePath) {
    if (GetUtils.isPDF(filePath!)) {
      return null;
    }
    return "The file must be PDF";
  }

  validPhoneNumber(String? phoneNumber) {
    if (GetUtils.isPhoneNumber(phoneNumber!)) {
      return null;
    }
    return 'Phone Number is not vaild';
  }

  validOpenHour(String? hour) {
    if (operHour.text.isEmpty) {
      return 'select time';
    }
    return null;
  }

  validCloseHour(String? hour) {
    if (closeHour.text.isEmpty) {
      return 'select time';
    }
    return null;
  }

  vaildFiel(String? file) {
    if (GetUtils.isPDF(file!)) {
      return null;
    }
    return 'File is not vaild';
  }

//filepicker
  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
      ],
    );

    if (result != null) {
      String filePath = result.files.first.path!;
      filePathController.text = filePath;
    }
  }

  Future workingtime(BuildContext context, TextEditingController text) async {
    TimeOfDay? newTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    final hour = newTime!.hour;
    final minute = newTime.minute;

    text.text = "$hour:$minute";
  }

  //steps

  Future continued() async {
    if (activeStep.value == 0) {
      if (profileFormkey.currentState!.validate()) {
        activeStep += 1;
      } else {
        Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
            snackPosition: SnackPosition.BOTTOM,
            colorText: ColorConstants.mainScaffoldBackgroundColor,
            backgroundColor: ColorConstants.snakbarColorError);
      }
    } else if (activeStep.value == 1) {
      if (personalFormkey.currentState!.validate() &&
          selectedItem.value != "" &&
          selectImage != null) {
        activeStep += 1;
      } else {
        Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
            snackPosition: SnackPosition.BOTTOM,
            colorText: ColorConstants.mainScaffoldBackgroundColor,
            backgroundColor: ColorConstants.snakbarColorError);
      }
    } else if (activeStep.value == 2) {
      if (contactlFormkey.currentState!.validate()) {
        activeStep += 1;
      } else {
        Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
            snackPosition: SnackPosition.BOTTOM,
            colorText: ColorConstants.mainScaffoldBackgroundColor,
            backgroundColor: ColorConstants.snakbarColorError);
      }
    } else if (activeStep.value == 3) {
      if (workingFormkey.currentState!.validate() &&
          selectedContainers.isNotEmpty) {
        Get.to(MyHomePage());
        AuthenticationRepository.instance.createUserWithEmailAndPassword(
            email.text.trim(), password.text.trim());
        UserRepository().createUser(VendorModel(
            status: false,
            username: vendorName.text.trim(),
            password: password.text.trim(),
            email: email.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            businessLicense: 'businessLicense',
            businesImage: 'businesImage',
            category: '',
            decription: description.text.trim(),
            address: address.text.trim(),
            coordanits: 'coordanits',
            opendayes: ['operHour.toString()'],
            openClose: 'openClose'));
      } else {
        Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
            snackPosition: SnackPosition.BOTTOM,
            colorText: ColorConstants.mainScaffoldBackgroundColor,
            backgroundColor: ColorConstants.snakbarColorError);
      }
    } else if (activeStep.value > 3) {}
  }

  cancel() {
    activeStep > 0 ? activeStep -= 1 : null;
  }

  Future onLogin() async {}

//category
  void upDateSelectedItem(String value) {
    selectedItem.value = value;
  }

//imagePicker
}
