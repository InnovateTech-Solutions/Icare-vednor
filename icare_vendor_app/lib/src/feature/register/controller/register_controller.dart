import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/model/vendor_model.dart';
import 'package:icare_vendor_app/src/core/usecase/authentication/authentication_repository.dart';
import 'package:icare_vendor_app/src/core/usecase/repository/vendor_repository/vendor_repository.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_days.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_image.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_location_controller.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_pdf.dart';
import 'package:icare_vendor_app/src/feature/register/view/complete_profile/complete_profile_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/constant/color.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  //GlobalKey
  final formkey = GlobalKey<FormState>();
  final completeFormKey = GlobalKey<FormState>();
  final workingFormkey = GlobalKey<FormState>();
  //Text Controller
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController vendorName = TextEditingController();
  TextEditingController operHour = TextEditingController();
  final TextEditingController closeHour = TextEditingController();
  final TextEditingController description = TextEditingController();
  //controllers
  final vendorRepository = Get.put(VendorRepository());
  final pdfController = Get.put(AddPdf());
  final imageController = Get.put(AddImage());
  final dayController = Get.put(AddWorkingDays());
  final coordinatesController = Get.put(AddLocation());
  //page Controller
  final PageController pageController = PageController(initialPage: 0);
  //
  String? selectedCategory;
  RxBool hide = true.obs;
  RxBool isChecked = false.obs;
  final _db = FirebaseFirestore.instance;

  hidePassword() {
    if (hide.value == false) {
      hide.value = true;
    } else if (hide.value == true) {
      hide.value = false;
    }
  }

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

  // validateAddress() {
  //   if (address.text != "") {
  //     return null;
  //   }
  //   return 'Address is not vaild';
  // }

  validateDescription(String? title) {
    if (description.text.isNotEmpty) {
      return null;
    }
    return 'Description is not vaild';
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

//time picker
  Future<void> futureWorkingTime(
      BuildContext context, TextEditingController text) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.green,
            timePickerTheme: TimePickerThemeData(
              dayPeriodTextColor: AppColor.mainTextColor,
              dayPeriodColor: AppColor.mainScaffoldBackgroundColor,
              dialHandColor: AppColor.mainScaffoldBackgroundColor,
              dialTextColor: AppColor.mainTextColor,
              hourMinuteTextColor: AppColor.mainTextColor,
              hourMinuteColor: AppColor.mainScaffoldBackgroundColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (newTime != null) {
      final hour = newTime.hour;
      final minute = newTime.minute;

      text.text = "$hour:$minute";
    }
  }

  Future<void> onRegister() async {
    if (formkey.currentState!.validate() && isChecked.isTrue) {
      Get.to(const CompleteProfilePage());
    } else {
      Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColor.mainScaffoldBackgroundColor,
          backgroundColor: AppColor.snakbarColorError);
    }
  }

  Future<bool> isUsernameTaken(String username) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('Vendor_test')
          .where('Name', isEqualTo: username)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      Get.snackbar("Error", "Error checking username: $error",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColor.mainScaffoldBackgroundColor,
          backgroundColor: AppColor.snakbarColorError);
      return false;
    }
  }

  //steps
  Future continued(VendorModel model) async {
    if (pageController.page == 0) {
      if (completeFormKey.currentState!.validate() &&
          selectedCategory != null &&
          pdfController.filePath.value != '' &&
          imageController.imagePath.value != null) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppColor.mainScaffoldBackgroundColor,
            backgroundColor: AppColor.snakbarColorError);
      }
    } else if (pageController.page == 1) {
      if (coordinatesController.coordinate.text.isNotEmpty) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        Get.snackbar("ERROR", "Make Sure to Select Location",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppColor.mainScaffoldBackgroundColor,
            backgroundColor: AppColor.snakbarColorError);
      }
    } else if (pageController.page == 2) {
      if (workingFormkey.currentState!.validate() &&
          dayController.selectedContainers.isNotEmpty) {
        bool usernameCheck = await isUsernameTaken(model.username);
        if (!usernameCheck) {
          Future<bool> code = AuthenticationRepository()
              .createUserWithEmailAndPassword(
                  email.text.trim(), password.text.trim());
          if (await code) {
            _db
                .collection('Vendor_test')
                .add(model.tojson())
                .whenComplete(() => Get.snackbar(
                    "Success", "Your account has been created",
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: AppColor.mainScaffoldBackgroundColor,
                    backgroundColor: AppColor.snakbarColorsuccessful))
                // ignore: body_might_complete_normally_catch_error
                .catchError((error) {
              Get.snackbar(error.toString(), "Something went wrong , try agin",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: AppColor.mainScaffoldBackgroundColor,
                  backgroundColor: AppColor.snakbarColorError);
            });
          }
        } else {
          Get.snackbar("ERROR", "Username  is taken",
              snackPosition: SnackPosition.BOTTOM,
              colorText: AppColor.mainScaffoldBackgroundColor,
              backgroundColor: AppColor.snakbarColorError);
        }
      } else {
        Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppColor.mainScaffoldBackgroundColor,
            backgroundColor: AppColor.snakbarColorError);
      }
    }
  }
}
