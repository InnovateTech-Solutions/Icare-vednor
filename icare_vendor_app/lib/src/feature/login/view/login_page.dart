import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../widget/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainScaffoldBackgroundColor,
        body: const LoginWidget(),
      ),
    );
  }
}
