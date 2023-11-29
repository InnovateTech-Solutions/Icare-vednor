import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../widget/pages_widget/profile/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
      body: const Center(
        child: ProfileWidget(),
      ),
    ));
  }
}
