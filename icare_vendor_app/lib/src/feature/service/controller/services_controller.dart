import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../model/containter_model.dart';

class ServicesController extends GetxController {
  static ServicesController get instance => Get.find();
  final formKey = GlobalKey<FormState>();
  final TextEditingController service = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController duration = TextEditingController();
  RxList<ContainerModel> services = <ContainerModel>[
    ContainerModel(
        mainLabel: "Services1",
        duration: "1 H",
        price: "25 jod",
        description: "Description"),
    ContainerModel(
        mainLabel: "Services2",
        duration: "2 H",
        price: "25 jod",
        description: "Description"),
    ContainerModel(
        mainLabel: "Services3",
        duration: "4 H",
        price: "25 jod",
        description: "Description"),
    ContainerModel(
        mainLabel: "Services4",
        duration: "5 H",
        price: "25 jod",
        description: "Description"),
    ContainerModel(
        mainLabel: "Services5",
        duration: "1 H",
        price: "25 jod",
        description: "Description"),
    ContainerModel(
      mainLabel: "Services",
      duration: "1 H",
      price: "25 jod",
      description: "Description",
    ),
  ].obs;

  validateService() {
    if (service.text.isEmpty) {
      return 'Service is not vaild';
    } else {
      return null;
    }
  }

  validateDescription(String s) {
    if (description.text.isNotEmpty) {
      return null;
    } else {
      return 'Description is not vaild';
    }
  }

  validatePrice() {
    if (price.text.isEmpty) {
      return 'Price is not vaild';
    } else {
      return null;
    }
  }

  validateDuration() {
    if (duration.text.isNotEmpty) {
      return null;
    } else {
      return 'Duration is not vaild';
    }
  }

  Future addService(ContainerModel servicesModel) async {
    if (formKey.currentState!.validate()) {
      Get.back();
      Get.snackbar("Success", "Service Added Successful",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColor.mainScaffoldBackgroundColor,
          backgroundColor: AppColor.snakbarColorsuccessful);

      services.add(servicesModel);
    } else {
      Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColor.mainScaffoldBackgroundColor,
          backgroundColor: AppColor.snakbarColorError);
    }
    return;
  }
}
