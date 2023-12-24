import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constant/constant.dart';
import '../../login/view/login_page.dart';
import '../../register/view/register_page.dart';
import '../../../core/widget/constant_widget/const_widget/constant_widget.dart';
import '../../../core/constant/sized_box.dart';
import '../../../core/widget/widget_collection/custom_widget.dart/button_widget.dart';

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
                tilte: AppConst.signUp),
          ],
        ),
      ),
    );
  }
}
