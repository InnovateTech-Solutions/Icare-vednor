import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/sized_box.dart';
import 'package:icare_vendor_app/src/core/model/form_model.dart';
import 'package:icare_vendor_app/src/core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import 'package:icare_vendor_app/src/feature/register/controller/register_controller.dart';
import 'package:icare_vendor_app/src/feature/register/widget/complete_profile/file_widget.dart';
import 'package:icare_vendor_app/src/feature/register/widget/text/register_text.dart';
import 'package:icare_vendor_app/src/feature/register/widget/widget_collection/category_select.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: controller.completeFormKey,
          child: SizedBox(
            height: 550.h,
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ListView(
                    children: [
                      FormWidget(
                        login: FormModel(
                          onTap: () {},
                          controller: controller.phoneNumber,
                          enableText: false,
                          hintText: "Phone Number",
                          icon: const Icon(
                            Icons.phone,
                            color: Color(0xffA1A8B0),
                          ),
                          invisible: false,
                          validator: (phone) =>
                              controller.validPhoneNumber(phone),
                          type: TextInputType.phone,
                          inputFormat: [controller.maskFormatterPhone],
                        ),
                      ),
                      AppSizes.smallHeightSizedBox,
                      const CategoerySelect(),
                      AppSizes.smallHeightSizedBox,
                      FormWidget(
                        login: FormModel(
                          onTap: () {},
                          controller: controller.description,
                          enableText: false,
                          hintText: "Description",
                          icon: const Icon(
                            Icons.line_weight_rounded,
                            color: Color(0xffA1A8B0),
                          ),
                          invisible: false,
                          validator: (description) =>
                              controller.validateDescription(description),
                          type: TextInputType.phone,
                          inputFormat: null,
                        ),
                      ),
                      AppSizes.xsmallHeightSizedBox,
                      RegisterText.mainText(" Attach the following documents:"),
                      fileContainer(),
                      imageContainer(),
                      SizedBox(
                        height: 60.h,
                      )
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: SizedBox(
                //     width: 327.w,
                //     height: 56.h,
                //     child: ButtonWidget(
                //         onTap: () {
                //           Get.to(const GoogleMapPage());
                //         },
                //         color: AppColor.mainTextColor,
                //         tilte: "Next"),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
