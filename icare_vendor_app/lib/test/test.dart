import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/helpers/local_storage/shared_prefrencess.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageUploadScreen(),
    );
  }
}

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  File? _pdf;
  final picker = ImagePicker();
  final TextEditingController _captionController = TextEditingController();

  Future<String> uploadFile(File file, String fileName) async {
    Reference firebaseStorage = FirebaseStorage.instance
        .ref()
        .child('pdfs/vendorLiceness/${DateTime.now()}.pdf');

    UploadTask uploadTask = firebaseStorage.putFile(_pdf!);

    await uploadTask.whenComplete(() => print('File uploaded'));

    return await firebaseStorage.getDownloadURL();
  }

  void saveFileMetadata(String fileName, String downloadURL) {
    FirebaseFirestore.instance.collection('pdf_metadata').add({
      'name': fileName,
      'url': downloadURL,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future uploadImage() async {
    if (_image == null) return;

    // Upload image to Firebase Storage
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child("images/vendorImages/${DateTime.now()}.jpg");
    UploadTask uploadTask = storageReference.putFile(_image!);
    await uploadTask.whenComplete(() => null);

    // Get image URL from Firebase Storage
    String imageUrl = await storageReference.getDownloadURL();

    // Save image details to Firebase Database
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("images").add({
      "userId": user?.uid,
      "imageUrl": imageUrl,
      "caption": _captionController.text,
      "timestamp": FieldValue.serverTimestamp(),
    });

    // Reset form
    _image = null;
    _captionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LocalUserController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _image != null
                ? Image.file(
                    _image!,
                    height: 150,
                  )
                : Placeholder(
                    fallbackHeight: 150,
                  ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: getImage,
              child: Text("Select Image"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _captionController,
              decoration: InputDecoration(labelText: "Caption"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: uploadImage,
              child: Text("Upload Image"),
            ),
          ],
        ),
      ),
    );
  }
}
