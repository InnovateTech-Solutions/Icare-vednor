import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/model/vendor_model.dart';

class ServiceRepository extends GetxController {
  static ServiceRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<VendorModel>> fetchVendorByCategory(String vendorID) async {
    final querySnapshot = await _db
        .collection('Services')
        .where('Vendor_Id', isEqualTo: vendorID)
        .get();

    return querySnapshot.docs
        .map((doc) => VendorModel.fromSnapShot(doc))
        .toList();
  }
}
