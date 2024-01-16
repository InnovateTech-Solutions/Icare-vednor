import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';

loginContainer(String icon, String title, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(20),
      width: 327.w,
      height: 56.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.boarderColor),
          borderRadius: BorderRadius.circular(25.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(icon),
          Text(
            title,
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor)),
          ),
          Container()
        ],
      ),
    ),
  );
}

orRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 1,
        width: 120.w,
        color: AppColor.boarderColor,
      ),
      Text(
        "OR",
        style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.fadeColor)),
      ),
      Container(
        height: 1,
        width: 120.w,
        color: AppColor.boarderColor,
      ),
    ],
  );
}
