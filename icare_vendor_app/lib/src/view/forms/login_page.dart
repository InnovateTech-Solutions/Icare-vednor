import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../widget/pages_widget/forms/login_widget.dart';

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
