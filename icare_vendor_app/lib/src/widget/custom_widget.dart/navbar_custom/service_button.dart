import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';
import '../../../getx/services_controller.dart';
import '../../../model/servicescontainter_model.dart';
import '../../constant_widget/sizes/sized_box.dart';
import '../../pages_widget/partial_widget/service_partial/service_dialog.dart';
import '../../text_widget/service_text.dart';

// ignore: must_be_immutable
class SrevicesButton extends StatelessWidget {
  SrevicesButton({super.key, required this.services});
  ServicesContainerModel services;
  final controller = Get.put(ServicesController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showServiceDetailsDialog(context, services.mainLabel,
            services.description, services.duration, services.price);
      },
      child: Container(
        height: 100.h,
        width: 350.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: ColorConstants.secondaryScaffoldBacground),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ServiceText.serviceText(services.mainLabel),
                  AppSizes.smallHeightSizedBox,
                  ServiceText.descriptionText(services.description)
                ],
              ),
              ServiceText.descriptionText(services.duration)
            ],
          ),
        ),
      ),
    );
  }
}
