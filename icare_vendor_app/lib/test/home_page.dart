import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/helpers/local_storage/shared_prefrencess.dart';
import 'package:icare_vendor_app/src/repository/authentication/authentication_repository.dart';
import 'package:icare_vendor_app/src/repository/vendor_repository/vendor_repository.dart';
import 'package:icare_vendor_app/src/widget/pages_widget/forms/Register/pdf_upload.dart';
import 'package:icare_vendor_app/test/drop_down.dart';
import 'package:icare_vendor_app/test/image_details.dart';
import 'package:icare_vendor_app/test/local_storage.dart';
import 'package:icare_vendor_app/test/pdf_loder.dart';
import 'package:icare_vendor_app/test/pdf_test.dart';
import 'package:icare_vendor_app/test/test.dart';
import 'package:icare_vendor_app/test/upload_image.dart';
import 'package:icare_vendor_app/test/user_details.dart';
import 'package:icare_vendor_app/test/vendor_details.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;

  void incrementCounter() {
    counter++;
  }
}

class MyController extends GetxController {
  // Your controller logic and state variables go here

  // Function to trigger widget rebuild
  void rebuildWidget() {
    update();
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final CounterController counterController = Get.put(CounterController());
//   final MyController controller = Get.put(MyController());

//   late User? user = _auth.currentUser;
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Status Check'),
//       ),
//       body: Column(
//         children: [
//           // Center(
//           //   child: Column(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: [
//           //       Text('Counter: $counter'),
//           //       SizedBox(height: 20),
//           //       ElevatedButton(
//           //         onPressed: () {
//           //           // Increment the counter and trigger a rebuild
//           //           setState(() {
//           //             counter++;
//           //           });
//           //         },
//           //         child: Text('Increment Counter and Reload'),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Obx(() => Text('Counter: ${counterController.counter}')),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Call the rebuild function when the button is pressed
//                   controller.rebuildWidget();
//                 },
//                 child: Text('Rebuild Widget'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Increment the counter using the GetX controller
//                   counterController.incrementCounter();
//                 },
//                 child: Text('Increment Counter  Reload'),
//               ),
//             ],
//           ),
//           Text(user!.email ?? ''),
//           Center(
//             child: FutureBuilder<bool>(
//               future: checkUserStatus(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else if (snapshot.data == true) {
//                   return Text('User status is true. Proceed.');
//                 } else {
//                   return Text('User status is false. Please wait.');
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

Future<bool> checkUserStatus() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user = _auth.currentUser;

  if (user != null) {
    try {
      // User is signed in, now check the status in Firestore
      QuerySnapshot<Map<String, dynamic>> userQuery = await FirebaseFirestore
          .instance
          .collection('Vendors_Test')
          .where('email', isEqualTo: user.email)
          .get();

      if (userQuery.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> userDoc = userQuery.docs.first;
        bool status = userDoc['status'];
        return status;
      } else {
        // User document not found
        return false;
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
      throw Exception('Failed to check user status.');
    }
  } else {
    // User is not signed in
    return false;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MyController controller = Get.put(MyController());

  final _authRepo = Get.put(AuthenticationRepository());
  late final email = _authRepo.firebaseuser.value?.email;

  getUserData() async {
    late final email = _authRepo.firebaseuser.value?.email;

    if (email != null) {
      return await UserRepository.instance.getVendor(email);
    } else {
      Get.snackbar("Error", "Login to get email");
    }
  }

  @override
  void initState() {
    super.initState();
    UserRepository().getVendor(email ?? '');
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LocalUserController());
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Rebuild Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => Get.to(DropList()), child: Text('data')),
          Obx(
            () => Text(
              LocalUserController.instance.phone.value,
              style: TextStyle(color: Colors.amber),
            ),
          ),
          Center(
            child: GetBuilder<MyController>(
              builder: (controller) {
                // Your widget content goes here
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(LocalUserController.instance.email.value)),
                    Obx(
                      () => Text(
                          'Email: ${LocalUserController.instance.vendorusername.value}'),
                    ),
                    ElevatedButton(
                        onPressed: () => Get.to(PdfTest()),
                        child: const Text('pdf functions')),
                    ElevatedButton(
                        onPressed: () => Get.to(Pdfunction()),
                        child: const Text('pdf functions')),
                    ElevatedButton(
                        onPressed: () => Get.to(HomePage()),
                        child: const Text('Your Widget Content')),
                    ElevatedButton(
                        onPressed: () => Get.to(UserDetailsScreen(
                              email: 'icare@icare.ko',
                            )),
                        child: const Text('get all vendor details')),
                    ElevatedButton(
                        onPressed: () => Get.to(VendorDetailsScreen()),
                        child: const Text('vendor details')),
                    ElevatedButton(
                        onPressed: () => Get.to(ImageUploadScreen()),
                        child: const Text('image function')),
                    ElevatedButton(
                        onPressed: () => AuthenticationRepository().logout(),
                        child: const Text('logout')),
                    ElevatedButton(
                      onPressed: () {
                        // Call the rebuild function when the button is pressed
                        controller.rebuildWidget();
                      },
                      child: Column(
                        children: [
                          const Text('Rebuild Widget'),
                          Center(
                            child: FutureBuilder<bool>(
                              future: checkUserStatus(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (snapshot.data == true) {
                                  return const Text(
                                      'User status is true. Proceed.');
                                } else {
                                  return const Text(
                                      'User status is false. Please wait.');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: MyHomePage(),
  ));
}
