import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Demo'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => Get.to(DetailsPage(
                    userId: user!.uid,
                  )),
              child: Text('data')),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                User? user = _auth.currentUser;

                if (user == null) {
                  // Sign in anonymously if not already signed in
                  await _auth.signInAnonymously();
                  user = _auth.currentUser;
                }

                // Pick an image from the gallery
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  // Upload image to Firebase Storage
                  String imageUrl =
                      await uploadImage(File(pickedFile.path), user!.uid);

                  // Save image details to Firebase Realtime Database
                  await saveImageDetails(user.uid, imageUrl);
                }
              },
              child: Text('Upload Image'),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> uploadImage(File imageFile, String userId) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('pic/$userId/${DateTime.now()}.png');
    UploadTask uploadTask = storageReference.putFile(imageFile);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<void> saveImageDetails(String userId, String imageUrl) async {
    await _firestore.collection('user_images').doc(userId).set({
      'image_url': imageUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}

class DetailsPage extends StatelessWidget {
  final String userId;

  const DetailsPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Details'),
      ),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('user_images')
              .doc(userId)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Text('Image details not found');
            }

            // Get the image URL from the document data
            String imageUrl = snapshot.data!.get('image_url');

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display the uploaded image
                Image.network(imageUrl),

                // Add other details here if needed
              ],
            );
          },
        ),
      ),
    );
  }
}
