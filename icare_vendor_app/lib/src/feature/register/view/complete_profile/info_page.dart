import 'package:flutter/material.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/widget/constant_widget/App_Bar/app_bar.dart';
import 'package:icare_vendor_app/src/feature/register/widget/complete_profile/info_widget.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainScaffoldBackgroundColor,
        appBar: Appbar.secAppBar("Complete Profile"),
        body: const Center(child: InfoWidget()),
      ),
    );
  }
}
