import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/constant/color.dart';
import '../../controller/register_controller.dart';
import '../../../../core/widget/widget_collection/custom_button/register_button.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(
                canvasColor: AppColor.mainScaffoldBackgroundColor,
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: AppColor.mainTextColor,
                    ),
              ),
              child: Obx(
                () => Stepper(
                  controlsBuilder: (context, controller) {
                    return const SizedBox.shrink();
                  },
                  currentStep: controller.activeStep.value,
                  type: controller.stepperType,
                  steps: AppConst.stepList(controller.activeStep.value),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegisterButton(
                color: AppColor.secondaryScaffoldBacground,
                onTap: () => {
                  controller.continued(),
                },
                tilte: 'Next',
              ),
              RegisterButton(
                color: AppColor.mainScaffoldBackgroundColor,
                onTap: () {
                  controller.cancel();
                },
                tilte: 'Cancel',
              )
            ],
          )
        ],
      ),
    );
  }
}
