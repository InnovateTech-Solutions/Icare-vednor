import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/constant.dart';
import '../controller/services_controller.dart';
import '../../../core/widget/constant_widget/const_widget/constant_widget.dart';
import '../../../core/constant/sized_box.dart';
import '../../../core/widget/widget_collection/custom_button/service_button.dart';
import '../../../core/widget/text_widget/service_text.dart';

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServicesController());

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Obx(
        () => controller.services.isEmpty
            ? const Center(
                child: Text('NO service avaliabe'),
              )
            : Column(
                children: [
                  ServiceText.mainHomeText(AppConst.services),
                  ConstantWidget.constDivider(),
                  AppSizes.smallHeightSizedBox,
                  SizedBox(
                      height: 500.h,
                      width: 350.w,
                      child: ListView.separated(
                          itemBuilder: ((context, index) {
                            return SrevicesButton(
                              services: controller.services[index],
                            );
                          }),
                          separatorBuilder: ((context, index) {
                            return AppSizes.smallHeightSizedBox;
                          }),
                          itemCount: controller.services.length))
                ],
              ),
      ),
    );
  }
}
