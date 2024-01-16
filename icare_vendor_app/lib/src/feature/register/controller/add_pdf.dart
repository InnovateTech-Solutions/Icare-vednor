import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_image.dart';

class AddPdf extends GetxController {
  static AddPdf get instance => Get.find();

  RxString vendorName = ''.obs;
  RxString uploadStatus = ''.obs;
  Rx<PlatformFile?> selectedFile = Rx<PlatformFile?>(null);
  RxString filePath = ''.obs;
  RxBool isFile = false.obs;
  final imageControllere = Get.put(AddImage());

  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      await uploadPDF(file);
    } else {
      updateUploadStatus("No file selected");
    }
  }

  void updateVendorName(String value) {
    vendorName.value = value;
  }

  Future<void> uploadPDF(PlatformFile file) async {
    selectedFile.value = file; // Update selected file
    String fileName = "${DateTime.now()}_${vendorName.value}.pdf";
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('vendor_pdfs/$fileName');

    try {
      await ref.putFile(File(file.path!));
      String pdfPath = await ref.getDownloadURL();
      await addToFirestore(pdfPath, vendorName.value);
      updateUploadStatus("PDF uploaded successfully!");
      filePath.value = pdfPath;
      print(filePath.value);
      update();
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

  Future<void> deletePDFByVendorName(String vendorName) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('vendor_pdfs')
          .where('vendorName', isEqualTo: vendorName)
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.delete();
        selectedFile.value = null;
        update();
      }

      updateUploadStatus("PDFs deleted successfully!");
    } catch (error) {
      updateUploadStatus("Error deleting PDFs");
    }
  }

  fileExpanded() {
    isFile.value = !isFile.value;
    if (imageControllere.isImage.value == true) {
      imageControllere.isImage.value = false;
    }
  }
}
