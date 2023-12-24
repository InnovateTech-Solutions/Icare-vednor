import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../widget/intropage_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.mainTextColor,
          body: const Center(child: IntroWidget())),
    );
  }
}
