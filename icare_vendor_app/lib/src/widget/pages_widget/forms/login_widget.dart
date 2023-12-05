import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/helpers/local_storage/shared_prefrencess.dart';
import 'package:icare_vendor_app/src/repository/vendor_repository/vendor_repository.dart';

import '../../../constant/app_constant.dart';
import '../../../constant/color.dart';
import '../../../getx/login_controller.dart';
import '../../../model/login_model.dart';
import '../../constant_widget/const_wiidget/constant_widget.dart';
import '../../constant_widget/sizes/sized_box.dart';
import '../../custom_widget.dart/button_widget.dart';
import '../../custom_widget.dart/form_widget.dart';
import '../../text_widget/form_text.dart';

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
                  AppSizes.mediumHeightSizedBox,
                  FormText.textFieldLabel(AppConst.password),
                  FormWidget(
                    login: Login(
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
                    color: ColorConstants.secondaryScaffoldBacground,
                  ),
                  FormText.forgetPasswordText(context),
                  AppSizes.mediumHeightSizedBox,
                  ButtonWidget(
                    onTap: () => {
                      controller.onLogin(),
                      UserRepository.instance.getVendor(controller.email.text),
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
