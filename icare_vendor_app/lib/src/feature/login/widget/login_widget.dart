import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/usecase/authentication/authentication_repository.dart';
import 'package:icare_vendor_app/src/core/usecase/repository/vendor_repository/vendor_repository.dart';
import 'package:icare_vendor_app/src/core/widget/widget_collection/custom_widget.dart/button_widget.dart';
import 'package:icare_vendor_app/src/feature/login/widget/login_container.dart';
import 'package:icare_vendor_app/src/feature/register/view/register_page.dart';
import 'package:icare_vendor_app/src/helpers/local_storage/shared_prefrencess.dart';

import '../../../core/constant/constant.dart';
import '../../../core/constant/sized_box.dart';
import '../../../core/model/form_model.dart';
import '../../../core/widget/constant_widget/const_widget/constant_widget.dart';
import '../../../core/widget/text_widget/form_text.dart';
import '../../../core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import '../controller/login_controller.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final controller = Get.put(LoginController());
  final authcontroller = Get.put(AuthenticationRepository());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: controller.formkey,
        child: SizedBox(
          height: 550.h,
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            children: [
              FormWidget(
                login: FormModel(
                  onTap: () {},
                  controller: controller.email,
                  enableText: false,
                  hintText: AppConst.email,
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
              FormText.forgetPasswordText(context),
              AppSizes.mediumHeightSizedBox,
              SizedBox(
                width: 327.w,
                height: 56.h,
                child: ButtonWidget(
                  onTap: () => {
                    controller.onLogin(),
                    VendorRepository.instance.getVendor(controller.email.text),
                    LocalUserController.instance.logIn(),
                  },
                  tilte: AppConst.login,
                  color: AppColor.mainTextColor,
                ),
              ),
              AppSizes.smallHeightSizedBox,
              Center(
                child: ConstantWidget.dontHaveAccountRow(
                    "Don’t have an account?", "Sign Up", () {
                  Get.to(const RegisterPage());
                }),
              ),
              AppSizes.mediumHeightSizedBox,
              orRow(),
              AppSizes.mediumHeightSizedBox,
              loginContainer("assets/google.svg", "Sign in with Google", () {}),
              AppSizes.smallHeightSizedBox,
              loginContainer("assets/Apple.svg", "Sign in with Apple", () {}),
              AppSizes.smallHeightSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
