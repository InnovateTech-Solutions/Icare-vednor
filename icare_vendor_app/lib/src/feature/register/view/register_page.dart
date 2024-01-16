import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/widget/constant_widget/App_Bar/app_bar.dart';
import '../widget/register/register_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainScaffoldBackgroundColor,
        appBar: Appbar.secAppBar("Sign Up"),
        body: const RegisterWidget(),
      ),
    );
  }
}
