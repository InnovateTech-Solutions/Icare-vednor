import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/widget/constant_widget/const_widget/constant_widget.dart';
import '../widget/services_widget.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.mainScaffoldBackgroundColor,
            body: const ServicesWidget(),
            floatingActionButton: ConstantWidget.serviceFloatingButton()));
  }
}
