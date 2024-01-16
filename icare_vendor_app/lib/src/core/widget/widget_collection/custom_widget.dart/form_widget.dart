import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';

import '../../../model/form_model.dart';

// ignore: must_be_immutable
class FormWidget extends StatefulWidget {
  FormWidget({
    required this.login,
    Key? key,
    this.icon,
    this.ontap,
  }) : super(key: key);
  FormModel login;
  IconData? icon;
  VoidCallback? ontap;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
          // maxLines: 3,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.mainTextColor)),
          controller: widget.login.controller,
          onTap: widget.login.onTap,
          readOnly: widget.login.enableText,
          inputFormatters: widget.login.inputFormat,
          keyboardType: widget.login.type,
          validator: widget.login.validator,
          obscureText: widget.login.invisible,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                alignment: Alignment.topLeft,
                onPressed: widget.ontap,
                icon: Icon(
                  widget.icon,
                  color: const Color(0xffA1A8B0),
                ),
              ),
              prefixIcon: widget.login.icon,
              filled: true,
              fillColor: AppColor.formColor,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.boarderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.boarderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
              hintText: widget.login.hintText,
              hintStyle: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: const Color(0xffA1A8B0))))),
    );
  }
}
