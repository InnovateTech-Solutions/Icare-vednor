// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/usecase/exception/signup_email_password_failure.dart';
import 'package:icare_vendor_app/src/feature/nav_bar/view/main_page.dart';
import 'package:icare_vendor_app/src/feature/start/view/intro_page.dart';
import 'package:icare_vendor_app/src/helpers/local_storage/shared_prefrencess.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseuser;

  @override
  void onReady() {
    firebaseuser = Rx<User?>(_auth.currentUser);
    firebaseuser.bindStream(_auth.userChanges());
    ever(firebaseuser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(const IntroPage()) : Get.offAll(const MainPage());
  }

  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      Get.snackbar("ERROR ", "${e.message}",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColor.mainScaffoldBackgroundColor,
          backgroundColor: AppColor.snakbarColorError);
      return false;
    }
  }

  Future<bool> login(String email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(LogInWithEmailAndPasswordFailure.code(e.code).message);
      return false;
    }
  }

  Future<void> logout() async =>
      {await _auth.signOut(), LocalUserController.instance.clearUserInfo()};
}
