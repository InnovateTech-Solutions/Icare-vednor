import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UploadUserImage extends StatefulWidget {
  const UploadUserImage({super.key});

  @override
  _UploadUserImageState createState() => _UploadUserImageState();
}

class _UploadUserImageState extends State<UploadUserImage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  User? _user;
  late CollectionReference _imagesCollection;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _imagesCollection = _firestore.collection('userss');
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    setState(() {
      _user = null;
    });
  }

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Get a reference to the storage bucket
      Reference storageReference =
          _storage.ref().child('images/${_user!.uid}/${DateTime.now()}.png');

      // Upload the file to Firebase Storage
      await storageReference.putFile(imageFile);

      // Get the download URL
      String downloadURL = await storageReference.getDownloadURL();

      // Save the download URL in Firestore
      await _imagesCollection.add({
        'userId': _user!.uid,
        'imageURL': downloadURL,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload App'),
        actions: [
          _user != null
              ? IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: _signOut,
                )
              : Container(),
        ],
      ),
      body: _user != null
          ? ImageList(user: _user!)
          : Center(
              child: ElevatedButton(
                onPressed: () async {
                  UserCredential userCredential =
                      await _auth.signInAnonymously();
                  setState(() {
                    _user = userCredential.user;
                  });
                },
                child: Text('Sign in Anonymously'),
              ),
            ),
      floatingActionButton: _user != null
          ? FloatingActionButton(
              onPressed: _uploadImage,
              tooltip: 'Upload Image',
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}

class ImageList extends StatelessWidget {
  final User user;

  ImageList({required this.user});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('images')
          .where('userId', isEqualTo: user.uid)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var images = snapshot.data!.docs;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            var imageURL = images[index]['imageURL'];

            return Card(
              child: CachedNetworkImage(
                imageUrl: imageURL,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            );
          },
        );
      },
    );
  }
}
