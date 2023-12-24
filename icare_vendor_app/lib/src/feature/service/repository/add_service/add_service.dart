import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/model/vendor_model.dart';

class AddServiceRepository extends GetxController {
  static AddServiceRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  addService(VendorModel vendorModel) {
    _db
        .collection('Service_Test')
        .add(vendorModel.tojson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been Add new service",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppColor.mainScaffoldBackgroundColor,
            backgroundColor: AppColor.snakbarColorsuccessful))
        .catchError((error) {
      Get.snackbar(error.toString(), "Something went wrong , try agin",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColor.mainScaffoldBackgroundColor,
          backgroundColor: AppColor.snakbarColorError);
      throw error;
    });
  }
}
