import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constant/app_constant.dart';
import '../../../../constant/color.dart';
import '../../../../getx/register_controller.dart';
import '../../../../model/login_model.dart';
import '../../../constant_widget/const_wiidget/constant_widget.dart';
import '../../../constant_widget/sizes/sized_box.dart';
import '../../../custom_widget.dart/form_widget.dart';
import '../../../text_widget/form_text.dart';

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
              FormText.registerText(
                  "specify your business hours for each day \nto let customers know when you're open"),
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
                      login: Login(
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
                      color: ColorConstants.secondaryScaffoldBacground,
                    ),
                  ),
                  FormText.textFieldLabel(" To  "),
                  Expanded(
                    child: FormWidget(
                      login: Login(
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
                      color: ColorConstants.secondaryScaffoldBacground,
                    ),
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
