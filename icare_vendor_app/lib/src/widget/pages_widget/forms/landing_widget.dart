import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constant/app_constant.dart';
import '../../../view/forms/login_page.dart';
import '../../../view/forms/register_page.dart';
import '../../constant_widget/const_wiidget/constant_widget.dart';
import '../../constant_widget/sizes/sized_box.dart';
import '../../custom_widget.dart/button_widget.dart';

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
            ConstantWidget.constDivider(),
            SizedBox(
              height: 100.h,
            ),
            ButtonWidget(
                onTap: () {
                  Get.to(const LoginPage());
                },
                tilte: AppConst.login),
            SizedBox(
              height: AppConst.largeSize.h,
            ),
            ButtonWidget(
                onTap: () {
                  Get.to(const RegisterPage());
                },
                tilte: AppConst.signUp)
          ],
        ),
      ),
    );
  }
}
