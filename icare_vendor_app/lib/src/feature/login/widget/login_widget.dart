import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/helpers/local_storage/shared_prefrencess.dart';
import 'package:icare_vendor_app/src/core/usecase/repository/vendor_repository/vendor_repository.dart';

import '../../../core/constant/constant.dart';
import '../../../core/constant/color.dart';
import '../controller/login_controller.dart';
import '../../../core/model/form_model.dart';
import '../../../core/widget/constant_widget/const_widget/constant_widget.dart';
import '../../../core/constant/sized_box.dart';
import '../../../core/widget/widget_collection/custom_widget.dart/button_widget.dart';
import '../../../core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import '../../../core/widget/text_widget/form_text.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Form(
            key: controller.formkey,
            child: SizedBox(
              height: 550.h,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                children: [
                  SvgPicture.asset(
                    "assets/IcareLogo.svg",
                    width: 114.w,
                    height: 57.h,
                  ),
                  FormText.mainText("LOGIN"),
                  ConstantWidget.constDivider(),
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
                      validator: (email) => controller.validateEmail(email),
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
                      icon: const Icon(Icons.lock),
                      invisible: true,
                      validator: (password) =>
                          controller.vaildatePassword(password),
                      type: TextInputType.visiblePassword,
                      inputFormat: null,
                    ),
                    color: AppColor.secondaryScaffoldBacground,
                  ),
                  FormText.forgetPasswordText(context),
                  AppSizes.mediumHeightSizedBox,
                  ButtonWidget(
                    onTap: () => {
                      controller.onLogin(),
                      VendorRepository.instance
                          .getVendor(controller.email.text),
                      LocalUserController.instance.logIn(),
                    },
                    tilte: AppConst.login,
                  ),
                  ConstantWidget.dontHaveAccountRow(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
