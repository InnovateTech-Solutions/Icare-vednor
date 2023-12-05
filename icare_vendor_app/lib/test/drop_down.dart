import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseService {
  final CollectionReference itemsCollection =
      FirebaseFirestore.instance.collection('Categories');

  Future<List<String>> getItems() async {
    QuerySnapshot querySnapshot = await itemsCollection.get();
    List<String> items =
        querySnapshot.docs.map((doc) => doc['Title'].toString()).toList();
    return items;
  }
}

class HomeController extends GetxController {
  final FirebaseService firebaseService = FirebaseService();
  RxList<String> items = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  Future<void> loadItems() async {
    items.value = await firebaseService.getItems();
  }
}

class DropList extends GetView<HomeController> {
  const DropList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase GetX Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => DropdownButton<String>(
              value: controller.items.isNotEmpty ? controller.items[0] : null,
              items: controller.items
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              onChanged: (String? newValue) {
                // Handle dropdown value change
                print(newValue);
              },
            ),
          ),
        ),
      ),
    );
  }
}
