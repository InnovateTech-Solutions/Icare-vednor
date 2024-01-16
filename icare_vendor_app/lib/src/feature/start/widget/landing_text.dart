import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';

class LandingText {
  static mainText(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22.sp,
              color: AppColor.blackColor)),
    );
  }

  static secText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: AppColor.fadeColor)),
    );
  }
}
