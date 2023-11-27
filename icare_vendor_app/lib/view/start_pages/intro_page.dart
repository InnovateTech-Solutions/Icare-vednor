import 'package:flutter/material.dart';
import 'package:icare_vendor_app/constant/color.dart';

import '../../widget/pages_widget/start_widget/intropage_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstants.mainTextColor,
          body: const Center(child: IntroWidget())),
    );
  }
}
