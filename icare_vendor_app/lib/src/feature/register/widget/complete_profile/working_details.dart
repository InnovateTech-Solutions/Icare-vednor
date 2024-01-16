import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/feature/register/widget/widget_collection/working_days.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/constant/sized_box.dart';
import '../../../../core/model/form_model.dart';
import '../../../../core/widget/text_widget/form_text.dart';
import '../../../../core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import '../../controller/register_controller.dart';

class WorkignDetailsWidget extends StatefulWidget {
  const WorkignDetailsWidget({super.key});

  @override
  State<WorkignDetailsWidget> createState() => _WorkignDetailsWidgetState();
}

class _WorkignDetailsWidgetState extends State<WorkignDetailsWidget> {
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
          key: controller.workingFormkey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: 450.h,
              width: 550.h,
              child: ListView(children: [
                AppSizes.smallHeightSizedBox,
                FormText.mainWorkingText("Select Working days"),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppConst.days.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: ((context, index) {
                      return AddDayes(
                        title: AppConst.days[index],
                      );
                    })),
                AppSizes.smallHeightSizedBox,
                FormText.mainWorkingText("Select Working Hours"),
                AppSizes.smallHeightSizedBox,
                Row(
                  children: [
                    FormText.secWorkingText("From "),
                    Expanded(
                      child: FormWidget(
                        login: FormModel(
                            onTap: () {
                              controller.futureWorkingTime(
                                  context, controller.operHour);
                            },
                            enableText: true,
                            controller: controller.operHour,
                            hintText: "00:00",
                            icon: null,
                            invisible: false,
                            validator: (openHour) =>
                                controller.validOpenHour(openHour),
                            type: TextInputType.datetime,
                            inputFormat: [controller.maskFormatterTime]),
                      ),
                    ),
                    FormText.secWorkingText(" To  "),
                    Expanded(
                      child: FormWidget(
                        login: FormModel(
                            enableText: true,
                            controller: controller.closeHour,
                            hintText: "00:00",
                            icon: null,
                            invisible: false,
                            validator: (closeHour) =>
                                controller.validCloseHour(closeHour),
                            type: TextInputType.datetime,
                            inputFormat: [controller.maskFormatterTime],
                            onTap: () {
                              controller.futureWorkingTime(
                                  context, controller.closeHour);
                            }),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          )),
    );
  }
}
