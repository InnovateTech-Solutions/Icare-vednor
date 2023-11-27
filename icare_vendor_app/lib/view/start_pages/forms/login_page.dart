import 'package:flutter/material.dart';
import 'package:icare_vendor_app/constant/color.dart';
import 'package:icare_vendor_app/widget/pages_widget/forms/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
        body: const LoginWidget(),
      ),
    );
  }
}
