import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/color.dart';

class ProfileText {
  static mainProfileText(String title) {
    return Text(title,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: ColorConstants.mainTextColor)));
  }

  static secProfileText(String title) {
    return Text(title,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w300,
                color: ColorConstants.mainTextColor)));
  }
}
