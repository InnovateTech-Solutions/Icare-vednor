import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/color.dart';

class FormText {
  static mainText(String title) {
    return Center(
      child: Text(title,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.mainTextColor))),
    );
  }

  static textFieldLabel(String title) {
    return Text(title,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColor.mainTextColor)));
  }

  static registerText(String title) {
    return Text(title,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.mainTextColor)));
  }

  static forgetPasswordText(context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password?",
        textAlign: TextAlign.end,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: AppColor.mainTextColor)),
      ),
    );
  }
}
