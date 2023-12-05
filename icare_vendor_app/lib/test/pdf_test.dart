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
      home: PdfTest(),
    );
  }
}

class PdfTest extends GetWidget {
  final MyControllerTest controller = Get.put(MyControllerTest());

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
            Obx(() {
              if (controller.selectedFile.value == null) {
                return Container(); // Empty container when no file is selected
              } else {
                return Image.network(
                  'https://cdn-icons-png.flaticon.com/512/3997/3997608.png',
                  height: 100,
                  width: 100,
                );
              }
            }),
            SizedBox(height: 20),
            Obx(() => Text(controller.uploadStatus.value)),
          ],
        ),
      ),
    );
  }
}

class MyControllerTest extends GetxController {
  RxString vendorName = ''.obs;
  RxString uploadStatus = ''.obs;
  Rx<PlatformFile?> selectedFile = Rx<PlatformFile?>(null);

  void updateVendorName(String value) {
    vendorName.value = value;
  }

  Future<void> uploadPDF(PlatformFile file) async {
    selectedFile.value = file; // Update selected file
    String fileName =
        DateTime.now().toString() + "_" + vendorName.value + ".pdf";
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
