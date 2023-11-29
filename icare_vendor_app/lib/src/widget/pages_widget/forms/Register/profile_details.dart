import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constant/app_constant.dart';
import '../../../../constant/color.dart';
import '../../../../getx/register_controller.dart';
import '../../../../model/login_model.dart';
import '../../../constant_widget/sizes/sized_box.dart';
import '../../../custom_widget.dart/form_widget.dart';
import '../../../text_widget/form_text.dart';

class ProfileDetailsWidget extends StatefulWidget {
  const ProfileDetailsWidget({super.key});

  @override
  State<ProfileDetailsWidget> createState() => _ProfileDetailsWidgetState();
}

class _ProfileDetailsWidgetState extends State<ProfileDetailsWidget> {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.profileFormkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 400.h,
            width: 400.w,
            child: ListView(children: [
              FormText.registerText(
                  "Enter your basic information to create your account"),
              AppSizes.mediumHeightSizedBox,
              FormText.textFieldLabel(AppConst.username),
              FormWidget(
                login: Login(
                  onTap: () {},
                  controller: controller.vendorName,
                  enableText: false,
                  hintText: AppConst.username,
                  icon: const Icon(Icons.abc),
                  invisible: false,
                  validator: (email) => controller.validateVendorName(email),
                  type: TextInputType.name,
                  inputFormat: null,
                ),
                color: ColorConstants.secondaryScaffoldBacground,
              ),
              AppSizes.smallHeightSizedBox,
              FormText.textFieldLabel(AppConst.email),
              FormWidget(
                login: Login(
                  onTap: () {},
                  controller: controller.email,
                  enableText: false,
                  hintText: AppConst.email,
                  icon: const Icon(Icons.email),
                  invisible: false,
                  validator: (email) => controller.validateEmail(email),
                  type: TextInputType.emailAddress,
                  inputFormat: null,
                ),
                color: ColorConstants.secondaryScaffoldBacground,
              ),
              AppSizes.smallHeightSizedBox,
              FormText.textFieldLabel(AppConst.password),
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
                  inputFormat: null,
                ),
                color: ColorConstants.secondaryScaffoldBacground,
              ),
              AppSizes.smallHeightSizedBox,
              FormText.textFieldLabel("Business License"),
              FormWidget(
                login: Login(
                  onTap: () {
                    controller.openFilePicker();
                  },
                  controller: controller.filePathController,
                  enableText: true,
                  hintText: "select file",
                  icon: const Icon(Icons.file_copy),
                  invisible: false,
                  validator: (pdf) => controller.vaildFiel(pdf),
                  type: TextInputType.url,
                  inputFormat: null,
                ),
                color: ColorConstants.secondaryScaffoldBacground,
              ),
            ]),
          ),
        ));
  }
}
