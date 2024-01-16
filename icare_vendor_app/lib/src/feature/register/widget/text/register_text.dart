import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';

class RegisterText {
  static termAndPolicyText() {
    return Text.rich(
      TextSpan(
        text: 'I agree to the medidoc ',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: AppColor.fadeColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        children: [
          TextSpan(
            text: 'Terms of  Service\n',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: AppColor.mainTextColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: 'and ',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: AppColor.fadeColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: AppColor.mainTextColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }

  static mainText(String title) {
    return Text(
      title,
      style: GoogleFonts.quicksand(
          textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColor.blackColor,
              fontSize: 16.sp)),
    );
  }

  static secText(String title) {
    return Text(
      title,
      style: GoogleFonts.quicksand(
          textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColor.blackColor,
              fontSize: 14.sp)),
    );
  }
}
