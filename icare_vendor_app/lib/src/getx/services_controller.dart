import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';
import '../model/services_model.dart';

class ServicesController extends GetxController {
  static ServicesController get instance => Get.find();
  final formKey = GlobalKey<FormState>();
  final TextEditingController service = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController duration = TextEditingController();
  RxList<ServicesModel> services = <ServicesModel>[
    ServicesModel(
        mainLabel: "Services1",
        duration: "1 H",
        price: "25 jod",
        description: "Description"),
    ServicesModel(
        mainLabel: "Services2",
        duration: "2 H",
        price: "25 jod",
        description: "Description"),
    ServicesModel(
        mainLabel: "Services3",
        duration: "4 H",
        price: "25 jod",
        description: "Description"),
    ServicesModel(
        mainLabel: "Services4",
        duration: "5 H",
        price: "25 jod",
        description: "Description"),
    ServicesModel(
        mainLabel: "Services5",
        duration: "1 H",
        price: "25 jod",
        description: "Description"),
    ServicesModel(
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

  Future addService(ServicesModel servicesModel) async {
    if (formKey.currentState!.validate()) {
      Get.back();
      Get.snackbar("Success", "Service Added Successful",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.mainScaffoldBackgroundColor,
          backgroundColor: ColorConstants.snakbarColorsuccessful);

      services.add(servicesModel);
    } else {
      Get.snackbar("ERROR", "MAKE SURE ALL FIELDS ARE FILLED IN",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.mainScaffoldBackgroundColor,
          backgroundColor: ColorConstants.snakbarColorError);
    }
    return;
  }
}
