import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../widget/pages_widget/forms/landing_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
          body: const Center(child: LandingWidget())),
    );
  }
}
