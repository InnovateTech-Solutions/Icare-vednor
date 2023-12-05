import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../widget/constant_widget/App_Bar/app_bar.dart';
import '../../widget/pages_widget/forms/addservice_widget.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Appbar.firstAppBar(),
      backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
      body: const AddServiceWidget(),
    ));
  }
}
