import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/constant/app_constant.dart';
import 'package:icare_vendor_app/model/login_model.dart';
import 'package:icare_vendor_app/widget/constant_widget/sizes/sized_box.dart';
import 'package:icare_vendor_app/widget/custom_widget.dart/form_widget.dart';
import 'package:icare_vendor_app/widget/text_widget/form_text.dart';

import '../../../../getx/register_controller.dart';

class ProfileDetailsWidget extends StatefulWidget {
  const ProfileDetailsWidget({super.key});

  @override
  State<ProfileDetailsWidget> createState() => _ProfileDetailsWidgetState();
}

class _ProfileDetailsWidgetState extends State<ProfileDetailsWidget> {
  final controller = Get.put(RegisterController());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 400.h,
            width: 400.w,
            child: ListView(children: [
              registerText(
                  "Enter your basic information to create your account"),
              AppSizes.mediumHeightSizedBox,
              textFieldLabel(AppConst.username),
              FormWidget(
                  login: Login(
                onTap: () {},
                controller: controller.email,
                enableText: false,
                hintText: AppConst.username,
                icon: const Icon(Icons.abc),
                invisible: false,
                validator: (email) => controller.validateVendorName(email),
                type: TextInputType.name,
                onChange: null,
                inputFormat: null,
              )),
              AppSizes.smallHeightSizedBox,
              textFieldLabel(AppConst.email),
              FormWidget(
                  login: Login(
                onTap: () {},
                controller: controller.vendorName,
                enableText: false,
                hintText: AppConst.email,
                icon: const Icon(Icons.email),
                invisible: false,
                validator: (email) => controller.validateEmail(email),
                type: TextInputType.emailAddress,
                onChange: null,
                inputFormat: null,
              )),
              AppSizes.smallHeightSizedBox,
              textFieldLabel(AppConst.password),
              FormWidget(
                  login: Login(
                onTap: () {},
                controller: controller.password,
                enableText: false,
                hintText: AppConst.password,
                icon: const Icon(Icons.password),
                invisible: true,
                validator: (email) => controller.vaildatePassword(email),
                type: TextInputType.visiblePassword,
                onChange: null,
                inputFormat: null,
              )),
              AppSizes.smallHeightSizedBox,
              textFieldLabel("Business License"),
              FormWidget(
                login: Login(
                  onTap: () {
                    controller.filePicker();
                  },
                  controller:
                      TextEditingController(text: controller.filePath.value),
                  enableText: true,
                  hintText: "Business License",
                  icon: const Icon(Icons.password),
                  invisible: true,
                  validator: (email) => controller.vaildatePassword(email),
                  type: TextInputType.text,
                  onChange: null,
                  inputFormat: null,
                ),
              )
            ]),
          ),
        ));
  }
}
