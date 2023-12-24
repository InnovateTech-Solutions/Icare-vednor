import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/constant.dart';
import 'package:icare_vendor_app/src/core/model/vendor_model.dart';
import 'package:icare_vendor_app/src/core/usecase/authentication/authentication_repository.dart';
import 'package:icare_vendor_app/src/core/usecase/repository/vendor_repository/vendor_repository.dart';
import 'package:icare_vendor_app/src/feature/nav_bar/view/main_page.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_location.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_pdf.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/constant/color.dart';

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
  final vendorRepository = Get.put(VendorRepository());
  final pdfController = Get.put(AddPdf());
  final coordinatesController = Get.put(AddLocation());

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

// create vendor

  createVendor(VendorModel vendorModel) {
    vendorRepository.createUser(vendorModel);
  }

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
      allowedExtensions: ['pdf'],
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
            colorText: AppColor.mainScaffoldBackgroundColor,
            backgroundColor: AppColor.snakbarColorError);
      }
    } else if (activeStep.value == 1) {
      if (personalFormkey.currentState!.validate()) {
        activeStep += 1;
      } else {
        Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppColor.mainScaffoldBackgroundColor,
            backgroundColor: AppColor.snakbarColorError);
      }
    } else if (activeStep.value == 2) {
      if (contactlFormkey.currentState!.validate()) {
        activeStep += 1;
      } else {
        Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppColor.mainScaffoldBackgroundColor,
            backgroundColor: AppColor.snakbarColorError);
      }
    } else if (activeStep.value == 3) {
      if (workingFormkey.currentState!.validate()) {
        Get.to(const MainPage());
        AuthenticationRepository.instance.createUserWithEmailAndPassword(
            email.text.trim(), password.text.trim());

        createVendor(VendorModel(
            status: false,
            username: vendorName.text.trim(),
            password: password.text.trim(),
            email: email.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            businessLicense: pdfController.filePath.value,
            businesImage: 'businesImage',
            category: '',
            decription: description.text.trim(),
            address: address.text.trim(),
            coordanits: coordinatesController.coordinate.text.trim(),
            opendayes: AppConst.days,
            openClose: '${closeHour.text.trim()} - ${operHour.text.trim()}'));
      } else {
        Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppColor.mainScaffoldBackgroundColor,
            backgroundColor: AppColor.snakbarColorError);
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
