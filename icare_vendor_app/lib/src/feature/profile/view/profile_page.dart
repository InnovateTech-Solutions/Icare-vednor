import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../widget/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.mainScaffoldBackgroundColor,
      body: const Center(
        child: ProfileWidget(),
      ),
    ));
  }
}
