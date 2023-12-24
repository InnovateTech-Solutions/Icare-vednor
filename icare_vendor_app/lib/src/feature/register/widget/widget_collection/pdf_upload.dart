import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class PdfUpload extends StatefulWidget {
  const PdfUpload({super.key});

  @override
  State<PdfUpload> createState() => _PdfUploadState();
}

class _PdfUploadState extends State<PdfUpload> {
  String vendorName = "";
  String uploadStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Vendor Name'),
              onChanged: (value) {
                setState(() {
                  vendorName = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  PlatformFile file = result.files.first;
                  String pdfPath = await uploadPDFToStorage(file, vendorName);
                  await addToFirestore(pdfPath, vendorName);
                  setState(() {
                    uploadStatus = "PDF uploaded successfully!";
                  });
                } else {
                  setState(() {
                    uploadStatus = "No file selected";
                  });
                }
              },
              child: const Text('Upload PDF'),
            ),
            const SizedBox(height: 20),
            Text(uploadStatus),
          ],
        ),
      ),
    );
  }

  Future<String> uploadPDFToStorage(
      PlatformFile file, String vendorName) async {
    String fileName = "${DateTime.now()}_$vendorName.pdf";
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('vendorLiceness/$fileName');
    await ref.putFile(File(file.path!));
    return ref.getDownloadURL();
  }

  Future<void> addToFirestore(String pdfPath, String vendorName) async {
    await FirebaseFirestore.instance.collection('vendor_pdfs').add({
      'pdfPath': pdfPath,
      'vendorName': vendorName,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
