import 'package:flutter/material.dart';
import 'package:icare_vendor_app/src/core/widget/constant_widget/App_Bar/app_bar.dart';
import 'package:icare_vendor_app/src/feature/register/widget/complete_profile/complete_widget.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Appbar.secAppBar("Complete Profile"),
        body: const CompleteProfileWidget(),
      ),
    );
  }
}
