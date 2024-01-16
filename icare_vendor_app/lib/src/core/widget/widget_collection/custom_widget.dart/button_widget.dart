import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, required this.onTap, required this.color, required this.tilte})
      : super(key: key);
  final String tilte;
  final VoidCallback onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 143.w,
        height: 60.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.mainTextColor, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: color),
        child: Center(
          child: Text(
            tilte,
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: color == AppColor.mainTextColor
                        ? AppColor.mainScaffoldBackgroundColor
                        : AppColor.mainTextColor)),
          ),
        ),
      ),
    );
  }
}
