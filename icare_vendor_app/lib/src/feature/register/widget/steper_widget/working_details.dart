import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/constant/color.dart';
import '../../controller/register_controller.dart';
import '../../../../core/model/form_model.dart';
import '../../../../core/widget/constant_widget/const_widget/constant_widget.dart';
import '../../../../core/constant/sized_box.dart';
import '../../../../core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import '../../../../core/widget/text_widget/form_text.dart';

class WorkignDetailsWidget extends StatefulWidget {
  const WorkignDetailsWidget({super.key});

  @override
  State<WorkignDetailsWidget> createState() => _WorkignDetailsWidgetState();
}

class _WorkignDetailsWidgetState extends State<WorkignDetailsWidget> {
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.workingFormkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 450.h,
            width: 550.h,
            child: ListView(children: [
              AppSizes.smallHeightSizedBox,
              FormText.textFieldLabel("Select Working days"),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppConst.days.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 110,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: ((context, index) {
                    return ConstantWidget.dayWidget(AppConst.days[index]);
                  })),
              AppSizes.smallHeightSizedBox,
              FormText.textFieldLabel("Select Working Hours"),
              AppSizes.smallHeightSizedBox,
              Row(
                children: [
                  FormText.textFieldLabel("From "),
                  Expanded(
                    child: FormWidget(
                      login: FormModel(
                          onTap: () {
                            controller.workingtime(
                                context, controller.operHour);
                          },
                          enableText: true,
                          controller: controller.operHour,
                          hintText: "00:00",
                          icon: const Icon(Icons.phone),
                          invisible: false,
                          validator: (openHour) =>
                              controller.validOpenHour(openHour),
                          type: TextInputType.datetime,
                          inputFormat: [controller.maskFormatterTime]),
                      color: AppColor.secondaryScaffoldBacground,
                    ),
                  ),
                  FormText.textFieldLabel(" To  "),
                  Expanded(
                    child: FormWidget(
                      login: FormModel(
                          enableText: false,
                          controller: controller.closeHour,
                          hintText: "00:00",
                          icon: const Icon(Icons.phone),
                          invisible: false,
                          validator: (closeHour) =>
                              controller.validCloseHour(closeHour),
                          type: TextInputType.datetime,
                          inputFormat: [controller.maskFormatterTime],
                          onTap: () {
                            controller.workingtime(
                                context, controller.closeHour);
                          }),
                      color: AppColor.secondaryScaffoldBacground,
                    ),
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
