// lib/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Vendors_Test')
          .doc(userId)
          .get();
      return snapshot.data() as Map<String, dynamic>;
    } catch (error) {
      print('Error fetching user data: $error');
      return null;
    }
  }
}

// lib/user_data_controller.dart

class UserDataController extends GetxController {
  RxString username = ''.obs;
  RxString phone = ''.obs;
  RxString email = ''.obs;

  void setUserData(String username, String phone, String email) {
    this.username.value = username;
    this.phone.value = phone;
    this.email.value = email;
  }
}

// lib/login_screen.dart

class LoginScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  Future<void> loginUser() async {
    User? user = await authService.signInWithEmailAndPassword(
      'asdad@dsfds.com',
      'sdadadasdas',
    );

    if (user != null) {
      Map<String, dynamic>? userData = await authService.getUserData(user.uid);
      if (userData != null) {
        UserDataController userDataController = Get.find();
        userDataController.setUserData(
          userData['Name'],
          userData['phoneNumber'],
          userData['email'],
        );

        // Save user data to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', userData['Name']);
        prefs.setString('phone', userData['phoneNumber']);
        prefs.setString('email', userData['email']);

        // Navigate to the home screen or any other screen
        Get.off(HomeScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: loginUser,
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            GetBuilder<UserDataController>(
              builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username: ${controller.username}'),
                  Text('Phone: ${controller.phone}'),
                  Text('Email: ${controller.email}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/home_screen.dart

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: GetBuilder<UserDataController>(
        init: UserDataController(),
        builder: (_) => LoginScreen(),
      ),
    );
  }
}
