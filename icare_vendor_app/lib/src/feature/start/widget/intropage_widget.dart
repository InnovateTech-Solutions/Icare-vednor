import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/sized_box.dart';
import '../../../core/widget/constant_widget/const_widget/constant_widget.dart';
import '../../../core/widget/text_widget/intro_text.dart';
import '../view/langing_page.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const LandingPage(), transition: Transition.fade);
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
            ConstantWidget.constDivider(),
            AppSizes.smallHeightSizedBox,
            mainIntroText("ALL THE CARE YOU NEED IS AT \nYOUR FINGERTIPS.")
          ],
        ),
      ),
    );
  }
}
