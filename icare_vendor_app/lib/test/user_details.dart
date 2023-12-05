import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsScreen extends StatelessWidget {
  final String email;

  UserDetailsScreen({required this.email});

  Future<DocumentSnapshot> getUserDetails() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Vendors_Test');

    QuerySnapshot querySnapshot =
        await users.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      return FirebaseFirestore.instance.collection('dummy').doc('empty').get();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder(
        future: getUserDetails(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var userData =
                (snapshot.data?.data() ?? {}) as Map<String, dynamic>;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${userData['Name'] ?? 'N/A'}'),
                  Text('Email: ${userData['email'] ?? 'N/A'}'),
                  Text('Name: ${userData['Description'] ?? 'N/A'}'),
                  Text('Email: ${userData['password'] ?? 'N/A'}'),

                  // Add more fields as needed
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: UserDetailsScreen(email: 'user@example.com'),
    ),
  );
}
