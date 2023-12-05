import 'package:get/get.dart';
import 'package:icare_vendor_app/src/model/vendor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserController extends GetxController {
  static LocalUserController get instance => Get.find();

  final RxString vendorusername = ''.obs;
  final RxString email = 'no email '.obs;
  final RxString phone = ''.obs;
  var isLoggedIn = false.obs;
  RxBool notification = false.obs;
  RxBool isSwitched = false.obs;

  @override
  void onInit() {
    super.onInit();
    logIn();
    checkLoginStatus();
    loadSwitchState();
  }

  Future<void> loadSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    isSwitched(prefs.getBool('switchState') ?? false);
  }

  Future<void> saveSwitchState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('switchState', value);
    isSwitched(value);
  }

  void checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
  }

  void logIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    isLoggedIn.value = true;
  }

  void setLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
    isLoggedIn.value = value;
  }

  Future<void> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    vendorusername.value = prefs.getString('username') ?? '';
    email.value = prefs.getString('email') ?? '';
    phone.value = prefs.getString('phone') ?? '';
  }

  Future<void> saveUserInfo(VendorModel vendor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', vendor.username);
    await prefs.setString('email', vendor.email);
    await prefs.setString('phone', vendor.phoneNumber);

    vendorusername.value = vendor.username;
    email.value = vendor.email;
    phone.value = vendor.phoneNumber;
    isLoggedIn.value = true;
  }

  Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('email');
    await prefs.remove('phone');
    await prefs.setBool('isLoggedIn', false);
    await prefs.setBool('switchState', false);

    vendorusername.value = '';
    email.value = '';
    phone.value = '';

    isLoggedIn.value = false;
    notification.value = false;
    isSwitched.value = false;
  }
}
