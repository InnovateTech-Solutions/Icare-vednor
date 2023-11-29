import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/view/main_page.dart';

import '../constant/color.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

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

  Future onLogin() async {
    if (formkey.currentState!.validate()) {
      Get.snackbar("Success", "Login Successful",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.mainScaffoldBackgroundColor,
          backgroundColor: ColorConstants.snakbarColorsuccessful);
      Get.to(const MainPage());
    } else {
      Get.snackbar("ERROR", "Email or Password is invild",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.mainScaffoldBackgroundColor,
          backgroundColor: ColorConstants.snakbarColorError);
    }
    return;
  }
}
