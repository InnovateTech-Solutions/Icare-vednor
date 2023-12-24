import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/widget/constant_widget/App_Bar/app_bar.dart';
import '../widget/add_service.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Appbar.firstAppBar(),
      backgroundColor: AppColor.mainScaffoldBackgroundColor,
      body: const AddServiceWidget(),
    ));
  }
}
