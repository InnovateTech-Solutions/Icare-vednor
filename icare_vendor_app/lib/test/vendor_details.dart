import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/helpers/local_storage/shared_prefrencess.dart';
import 'package:icare_vendor_app/src/model/vendor_model.dart';

class VendorDetailsScreen extends StatefulWidget {
  const VendorDetailsScreen({super.key});

  @override
  _VendorDetailsScreenState createState() => _VendorDetailsScreenState();
}

class _VendorDetailsScreenState extends State<VendorDetailsScreen> {
  TextEditingController emailController = TextEditingController();
  VendorModel? vendorDetails;
  final controller = Get.put(LocalUserController());
  final _db = FirebaseFirestore.instance;
  final userController = Get.put(LocalUserController());
  Future<VendorModel> getVendorDetails(String email) async {
    final snapshot = await _db
        .collection("Vendors_Test")
        .where("email", isEqualTo: email)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final userdata =
          snapshot.docs.map((e) => VendorModel.fromSnapShot(e)).single;

      controller.saveUserInfo(userdata);

      return userdata;
    } else {
      throw Exception("Vendor not found for email: $email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Details Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Enter Email'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Call the getVendorDetails function and update the UI with the result
                try {
                  VendorModel details =
                      await getVendorDetails(emailController.text);
                  setState(() {
                    vendorDetails = details;
                  });
                } catch (e) {
                  // Handle errors here
                  print('Error: $e');
                }
              },
              child: const Text('Get Vendor Details'),
            ),
            const SizedBox(height: 16.0),
            if (vendorDetails != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Vendor Name: ${vendorDetails!.username}'),
                  Text('Vendor Email: ${vendorDetails!.email}'),
                  Text('Vendor Email: ${vendorDetails!.address}'),
                  Text('Vendor Email: ${vendorDetails!.password}'),
                  Text('Vendor Email: ${vendorDetails!.status}'),
                  Text('Vendor Email: ${vendorDetails!.businessLicense}'),
                  Text('Vendor Email: ${vendorDetails!.decription}'),
                  Text('Vendor Email: ${vendorDetails!.status}'),
                  Text('Vendor Email: ${vendorDetails!.address}'),
                  // Add other properties as needed
                ],
              ),
          ],
        ),
      ),
    );
  }
}
