import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Pdfunction(),
    );
  }
}

class Pdfunction extends GetWidget {
  Pdfunction({super.key});

  @override
  final PDFController controller = Get.put(PDFController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Vendor Name'),
              onChanged: (value) {
                controller.updateVendorName(value);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  PlatformFile file = result.files.first;
                  await controller.uploadPDF(file);
                } else {
                  controller.updateUploadStatus("No file selected");
                }
              },
              child: Text('Upload PDF'),
            ),
            SizedBox(height: 20),
            Obx(() => Text(controller.uploadStatus.value)),
          ],
        ),
      ),
    );
  }
}

class PDFController extends GetxController {
  RxString vendorName = ''.obs;
  RxString uploadStatus = ''.obs;

  void updateVendorName(String value) {
    vendorName.value = value;
  }

  Future<void> uploadPDF(PlatformFile file) async {
    String fileName = "${DateTime.now()}_${vendorName.value}.pdf";
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('vendor_pdfs/$fileName');

    try {
      await ref.putFile(File(file.path!));
      String pdfPath = await ref.getDownloadURL();
      await addToFirestore(pdfPath, vendorName.value);
      updateUploadStatus("PDF uploaded successfully!");
    } catch (error) {
      updateUploadStatus("Error uploading PDF");
    }
  }

  void updateUploadStatus(String status) {
    uploadStatus.value = status;
  }

  Future<void> addToFirestore(String pdfPath, String vendorName) async {
    await FirebaseFirestore.instance.collection('vendor_pdfs').add({
      'pdfPath': pdfPath,
      'vendorName': vendorName,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
