import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/constant/color.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton(
      {super.key,
      required this.onTap,
      required this.tilte,
      required this.color});
  final String tilte;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 100.w,
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: color),
          child: Center(
            child: Text(
              tilte,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: ColorConstants.mainTextColor)),
            ),
          ),
        ));
  }
}
