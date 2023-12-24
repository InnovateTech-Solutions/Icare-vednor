import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/color.dart';

class ServiceText {
  static mainHomeText(String title) {
    return Text(title,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.mainTextColor)));
  }

  static serviceText(String title) {
    return Text(title,
        textAlign: TextAlign.start,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.mainTextColor)));
  }

  static descriptionText(String title) {
    return Text(title,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColor.mainTextColor)));
  }
}
