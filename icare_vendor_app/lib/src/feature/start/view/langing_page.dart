import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../widget/landing_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.mainScaffoldBackgroundColor,
          body: const Center(child: LandingWidget())),
    );
  }
}
