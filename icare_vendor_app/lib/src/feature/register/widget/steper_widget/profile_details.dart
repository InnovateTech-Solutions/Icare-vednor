import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/constant/color.dart';
import '../../controller/register_controller.dart';
import '../../../../core/model/form_model.dart';
import '../../../../core/constant/sized_box.dart';
import '../../../../core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import '../../../../core/widget/text_widget/form_text.dart';

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
        child: SizedBox(
          height: 400.h,
          width: 400.w,
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FormText.registerText(
                    "Enter your basic information to create your account"),
                AppSizes.mediumHeightSizedBox,
                FormText.textFieldLabel(AppConst.shopName),
                FormWidget(
                  login: FormModel(
                    onTap: () {},
                    controller: controller.vendorName,
                    enableText: false,
                    hintText: AppConst.shopName,
                    icon: const Icon(Icons.abc),
                    invisible: false,
                    validator: null,
                    // (email) => controller.validateVendorName(email),
                    type: TextInputType.name,
                    inputFormat: null,
                  ),
                  color: AppColor.secondaryScaffoldBacground,
                ),
                AppSizes.mediumHeightSizedBox,
                FormText.textFieldLabel(AppConst.email),
                FormWidget(
                  login: FormModel(
                    onTap: () {},
                    controller: controller.email,
                    enableText: false,
                    hintText: AppConst.email,
                    icon: const Icon(Icons.email),
                    invisible: false,
                    validator: null,
                    // (email) => controller.validateEmail(email),
                    type: TextInputType.emailAddress,
                    inputFormat: null,
                  ),
                  color: AppColor.secondaryScaffoldBacground,
                ),
                AppSizes.mediumHeightSizedBox,
                FormText.textFieldLabel(AppConst.password),
                FormWidget(
                  login: FormModel(
                    onTap: () {},
                    controller: controller.password,
                    enableText: false,
                    hintText: AppConst.password,
                    icon: const Icon(Icons.password),
                    invisible: true,
                    validator: null,
                    // (email) => controller.vaildatePassword(email),
                    type: TextInputType.visiblePassword,
                    inputFormat: null,
                  ),
                  color: AppColor.secondaryScaffoldBacground,
                ),
                AppSizes.smallHeightSizedBox,
                //   FormWidget(
                //     login: Login(
                //       onTap: () {
                //         controller.openFilePicker();
                //       },
                //       controller: controller.filePathController,
                //       enableText: true,
                //       hintText: "select file",
                //       icon: const Icon(Icons.file_copy),
                //       invisible: false,
                //       validator: null,
                //       type: TextInputType.url,
                //       inputFormat: null,
                //     ),
                //     color: ColorConstants.secondaryScaffoldBacground,
                //   ),
              ]),
        ));
  }
}
