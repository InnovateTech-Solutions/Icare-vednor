import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//remove the chile
headerWidget() {
  return Container(
    height: 250.h,
    width: double.infinity.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r)),
    ),
    child: Image.asset(
        "assets/Dr.Lamya's Laser Specialist Dental Center Janabiya.webp"),
  );
}
