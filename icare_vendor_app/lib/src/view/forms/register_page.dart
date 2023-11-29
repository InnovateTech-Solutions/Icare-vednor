import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../widget/constant_widget/App_Bar/app_bar.dart';
import '../../widget/pages_widget/forms/Register/register_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
        appBar: Appbar.firstAppBar(),
        body: const RegisterWidget(),
      ),
    );
  }
}
