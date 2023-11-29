import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Login {
  TextEditingController controller = TextEditingController();
  String hintText;
  Icon icon;
  bool invisible;
  bool enableText;
  VoidCallback onTap;

  final String? Function(String?)? validator;
  TextInputType type;
  List<TextInputFormatter>? inputFormat;
  Login(
      {required this.controller,
      required this.enableText,
      required this.hintText,
      required this.icon,
      required this.invisible,
      required this.validator,
      required this.onTap,
      required this.type,
      required this.inputFormat});
}
