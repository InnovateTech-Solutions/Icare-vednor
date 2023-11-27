import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/constant/app_constant.dart';
import 'package:icare_vendor_app/getx/register_controller.dart';
import 'package:icare_vendor_app/model/login_model.dart';
import 'package:icare_vendor_app/widget/constant_widget/sizes/const_wiidget/constant_widget.dart';
import 'package:icare_vendor_app/widget/constant_widget/sizes/sized_box.dart';
import 'package:icare_vendor_app/widget/custom_widget.dart/form_widget.dart';
import 'package:icare_vendor_app/widget/text_widget/form_text.dart';

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
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 450.h,
        width: 550.h,
        child: ListView(children: [
          registerText(
              "specify your business hours for each day \nto let customers know when you're open"),
          AppSizes.smallHeightSizedBox,
          textFieldLabel("Select Working days"),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: AppConst.days.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 110,
                crossAxisSpacing: 10,
              ),
              itemBuilder: ((context, index) {
                return dayWidget(AppConst.days[index]);
              })),
          AppSizes.smallHeightSizedBox,
          textFieldLabel("Select Working Hours"),
          AppSizes.smallHeightSizedBox,
          Row(
            children: [
              textFieldLabel("From "),
              Expanded(
                child: FormWidget(
                    login: Login(
                        onTap: () {},
                        enableText: false,
                        controller: controller.phoneNumber,
                        hintText: "00:00",
                        icon: const Icon(Icons.phone),
                        invisible: false,
                        validator: (email) =>
                            controller.vaildPhoneNumber(email),
                        type: TextInputType.number,
                        onChange: null,
                        inputFormat: [controller.maskFormatterTime])),
              ),
              textFieldLabel(" To  "),
              Expanded(
                child: FormWidget(
                    login: Login(
                        enableText: false,
                        controller: controller.phoneNumber,
                        hintText: "00:00",
                        icon: const Icon(Icons.phone),
                        invisible: false,
                        validator: (email) =>
                            controller.vaildPhoneNumber(email),
                        type: TextInputType.number,
                        onChange: null,
                        inputFormat: [controller.maskFormatterTime],
                        onTap: () {})),
              ),
            ],
          )
          // googleMAp
        ]),
      ),
    ));
  }
}
