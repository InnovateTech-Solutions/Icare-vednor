import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constant/app_constant.dart';
import '../../../../constant/color.dart';
import '../../../../getx/profile_controller.dart';
import '../../../../getx/register_controller.dart';
import '../../../../model/login_model.dart';
import '../../../constant_widget/sizes/sized_box.dart';
import '../../../custom_widget.dart/form_widget.dart';
import '../../../text_widget/form_text.dart';

final registerController = Get.put(RegisterController());
final profileController = Get.put(ProfileController());

void showProfileDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorConstants.secondaryScaffoldBacground,
          content: Form(
            key: profileController.formkey,
            child: SizedBox(
              width: 250.w,
              height: 270.h,
              child: ListView(
                children: [
                  FormText.textFieldLabel(AppConst.phoneNumber),
                  FormWidget(
                      login: Login(
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
                      color: ColorConstants.mainScaffoldBackgroundColor),
                  AppSizes.xsmallHeightSizedBox,
                  FormText.textFieldLabel("Address"),
                  FormWidget(
                      login: Login(
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
                      color: ColorConstants.mainScaffoldBackgroundColor),
                  AppSizes.xsmallHeightSizedBox,
                  FormText.textFieldLabel(AppConst.email),
                  FormWidget(
                      login: Login(
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
                      color: ColorConstants.mainScaffoldBackgroundColor)
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
