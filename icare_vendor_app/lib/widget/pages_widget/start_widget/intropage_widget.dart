import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/view/start_pages/forms/sign_up_in.dart';
import 'package:icare_vendor_app/widget/constant_widget/sizes/const_wiidget/constant_widget.dart';
import 'package:icare_vendor_app/widget/constant_widget/sizes/sized_box.dart';
import 'package:icare_vendor_app/widget/text_widget/intro_text.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const SignUpInPage(), transition: Transition.fade);
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/iCARE.svg",
              width: 200.w,
              height: 90.h,
            ),
            AppSizes.smallHeightSizedBox,
            constDivider(),
            AppSizes.smallHeightSizedBox,
            mainIntroText("ALL THE CARE YOU NEED IS AT \nYOUR FINGERTIPS.")
          ],
        ),
      ),
    );
  }
}