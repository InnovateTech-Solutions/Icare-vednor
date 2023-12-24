import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/constant.dart';
import '../../../core/constant/color.dart';
import '../controller/profile_controller.dart';
import '../../register/controller/register_controller.dart';
import '../../../core/model/form_model.dart';
import '../../../core/constant/sized_box.dart';
import '../../../core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import '../../../core/widget/text_widget/form_text.dart';

final registerController = Get.put(RegisterController());
final profileController = Get.put(ProfileController());

void showProfileDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.secondaryScaffoldBacground,
          content: Form(
            key: profileController.formkey,
            child: SizedBox(
              width: 250.w,
              height: 270.h,
              child: ListView(
                children: [
                  FormText.textFieldLabel(AppConst.phoneNumber),
                  FormWidget(
                      login: FormModel(
                          controller: registerController.phoneNumber,
                          enableText: false,
                          hintText: AppConst.phoneNumber,
                          icon: const Icon(Icons.phone),
                          invisible: false,
                          validator: (number) =>
                              registerController.validPhoneNumber(number),
                          onTap: () {},
                          type: TextInputType.phone,
                          inputFormat: [registerController.maskFormatterPhone]),
                      color: AppColor.mainScaffoldBackgroundColor),
                  AppSizes.xsmallHeightSizedBox,
                  FormText.textFieldLabel("Address"),
                  FormWidget(
                      login: FormModel(
                          controller: registerController.address,
                          enableText: false,
                          hintText: "Address",
                          icon: const Icon(Icons.location_city),
                          invisible: false,
                          validator: (address) =>
                              registerController.validateAddress(),
                          onTap: () {},
                          type: TextInputType.text,
                          inputFormat: null),
                      color: AppColor.mainScaffoldBackgroundColor),
                  AppSizes.xsmallHeightSizedBox,
                  FormText.textFieldLabel(AppConst.email),
                  FormWidget(
                      login: FormModel(
                          controller: registerController.email,
                          enableText: false,
                          hintText: AppConst.email,
                          icon: const Icon(Icons.email),
                          invisible: false,
                          validator: (email) =>
                              registerController.validateEmail(email),
                          onTap: () {},
                          type: TextInputType.emailAddress,
                          inputFormat: null),
                      color: AppColor.mainScaffoldBackgroundColor)
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                profileController.onEdit();
              },
              child: FormText.textFieldLabel('Edit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: FormText.textFieldLabel('Cancel'),
            ),
          ],
        );
      });
}
