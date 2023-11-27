import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/constant/app_constant.dart';
import 'package:icare_vendor_app/constant/color.dart';
import 'package:icare_vendor_app/getx/register_controller.dart';
import 'package:icare_vendor_app/widget/custom_widget.dart/register_forms/register_button.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(
                canvasColor: ColorConstants.mainScaffoldBackgroundColor,
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: ColorConstants.mainTextColor,
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RegisterButton(
                color: ColorConstants.secondaryScaffoldBacground,
                onTap: () => controller.continued(),
                tilte: 'Next',
              ),
              RegisterButton(
                color: ColorConstants.mainScaffoldBackgroundColor,
                onTap: () => controller.cancel(),
                tilte: 'Cancel',
              )
            ],
          )
        ],
      ),
    );
  }
}
