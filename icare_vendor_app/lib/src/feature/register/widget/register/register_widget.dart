import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/sized_box.dart';
import 'package:icare_vendor_app/src/core/model/form_model.dart';
import 'package:icare_vendor_app/src/core/widget/constant_widget/const_widget/constant_widget.dart';
import 'package:icare_vendor_app/src/core/widget/widget_collection/custom_widget.dart/button_widget.dart';
import 'package:icare_vendor_app/src/core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import 'package:icare_vendor_app/src/feature/login/view/login_page.dart';
import 'package:icare_vendor_app/src/feature/register/widget/text/register_text.dart';

import '../../../../core/constant/color.dart';
import '../../controller/register_controller.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final controller = Get.put(RegisterController());
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: controller.formkey,
          child: SizedBox(
            height: 550.h,
            width: double.infinity,
            child: ListView(
              children: [
                FormWidget(
                  login: FormModel(
                    onTap: () {},
                    controller: controller.vendorName,
                    enableText: false,
                    hintText: "Vendor Name",
                    icon: const Icon(
                      Icons.person_2_outlined,
                      color: Color(0xffA1A8B0),
                    ),
                    invisible: false,
                    validator: (name) => controller.validateVendorName(name),
                    type: TextInputType.name,
                    inputFormat: null,
                  ),
                ),
                AppSizes.smallHeightSizedBox,
                FormWidget(
                  login: FormModel(
                    onTap: () {},
                    controller: controller.email,
                    enableText: false,
                    hintText: "Enter your email",
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Color(0xffA1A8B0),
                    ),
                    invisible: false,
                    validator: (email) => controller.validateEmail(email),
                    type: TextInputType.emailAddress,
                    inputFormat: null,
                  ),
                ),
                AppSizes.smallHeightSizedBox,
                Obx(
                  () => FormWidget(
                    ontap: () {
                      controller.hidePassword();
                    },
                    icon: controller.hide.value == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    login: FormModel(
                      onTap: () {},
                      controller: controller.password,
                      enableText: false,
                      hintText: "Enter your password",
                      icon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xffA1A8B0),
                      ),
                      invisible: controller.hide.value,
                      validator: (password) =>
                          controller.vaildatePassword(password),
                      type: TextInputType.visiblePassword,
                      inputFormat: null,
                    ),
                  ),
                ),
                AppSizes.xsmallHeightSizedBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Checkbox(
                        activeColor: AppColor.mainTextColor,
                        value: controller.isChecked.value,
                        onChanged: (newValue) {
                          controller.isChecked.value = newValue!;
                        },
                      ),
                    ),
                    RegisterText.termAndPolicyText(),
                  ],
                ),
                AppSizes.mediumHeightSizedBox,
                SizedBox(
                  width: 327.w,
                  height: 56.h,
                  child: ButtonWidget(
                    onTap: () => {controller.onRegister()},
                    tilte: "Next",
                    color: AppColor.mainTextColor,
                  ),
                ),
                AppSizes.smallHeightSizedBox,
                Center(
                  child: ConstantWidget.dontHaveAccountRow(
                      "already have an account?", "Login", () {
                    Get.to(const LoginPage());
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
