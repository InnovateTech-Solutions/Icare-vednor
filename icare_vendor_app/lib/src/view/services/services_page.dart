import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../widget/constant_widget/const_wiidget/constant_widget.dart';
import '../../widget/pages_widget/navbar_widget/services_widget.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
            body: const ServicesWidget(),
            floatingActionButton: ConstantWidget.serviceFloatingButton()));
  }
}
