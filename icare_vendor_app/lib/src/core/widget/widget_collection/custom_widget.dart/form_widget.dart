import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color.dart';
import '../../../model/form_model.dart';

// ignore: must_be_immutable
class FormWidget extends StatefulWidget {
  FormWidget({required this.login, required this.color, Key? key})
      : super(key: key);
  FormModel login;
  Color color;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
          controller: widget.login.controller,
          onTap: widget.login.onTap,
          readOnly: widget.login.enableText,
          inputFormatters: widget.login.inputFormat,
          keyboardType: widget.login.type,
          validator: widget.login.validator,
          obscureText: widget.login.invisible,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.color,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.secondaryScaffoldBacground),
                borderRadius: BorderRadius.all(Radius.circular(7.r))),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.secondaryScaffoldBacground),
                borderRadius: BorderRadius.all(Radius.circular(7.r))),
            hintText: widget.login.hintText,
          )),
    );
  }
}
