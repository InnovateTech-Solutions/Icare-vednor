import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/widget/widget_collection/custom_widget.dart/button_widget.dart';
import 'package:icare_vendor_app/src/feature/login/view/login_page.dart';
import 'package:icare_vendor_app/src/feature/register/view/register_page.dart';
import 'package:icare_vendor_app/src/feature/start/widget/landing_text.dart';

import '../../../core/constant/sized_box.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppSizes.largeHeightSizedBox,
            SvgPicture.asset(
              "assets/IcareLogo.svg",
              width: 200.w,
              height: 90.h,
            ),
            AppSizes.mediumHeightSizedBox,
            LandingText.mainText("Let’s get started!"),
            AppSizes.smallHeightSizedBox,
            LandingText.secText(
                "Login to enjoy the features we’ve\n provided, and stay healthy!"),
            AppSizes.largeHeightSizedBox,
            SizedBox(
              width: 263.w,
              height: 56.h,
              child: ButtonWidget(
                onTap: () {
                  Get.to(const LoginPage());
                },
                tilte: 'Login',
                color: AppColor.mainTextColor,
              ),
            ),
            AppSizes.smallHeightSizedBox,
            SizedBox(
              width: 263.w,
              height: 56.h,
              child: ButtonWidget(
                onTap: () {
                  Get.to(const RegisterPage());
                },
                tilte: 'Sign Up',
                color: AppColor.mainScaffoldBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
