import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/constant/app_constant.dart';
import 'package:icare_vendor_app/src/constant/color.dart';
import 'package:icare_vendor_app/src/getx/profile_controller.dart';
import 'package:icare_vendor_app/src/getx/register_controller.dart';
import 'package:icare_vendor_app/src/model/login_model.dart';
import 'package:icare_vendor_app/src/widget/constant_widget/sizes/sized_box.dart';
import 'package:icare_vendor_app/src/widget/custom_widget.dart/form_widget.dart';
import 'package:icare_vendor_app/src/widget/text_widget/form_text.dart';

final registerController = Get.put(RegisterController());
final profileController = Get.put(ProfileController());

void showDialoge(BuildContext context) {
  showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return SizedBox(
        height: 300,
        child: Form(
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
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
  );
}
