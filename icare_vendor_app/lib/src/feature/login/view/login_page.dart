import 'package:flutter/material.dart';
import 'package:icare_vendor_app/src/core/widget/constant_widget/App_Bar/app_bar.dart';

import '../../../core/constant/color.dart';
import '../widget/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar.secAppBar("Login"),
        backgroundColor: AppColor.mainScaffoldBackgroundColor,
        body: const LoginWidget(),
      ),
    );
  }
}
