import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/constant/color.dart';
import '../../controller/add_location.dart';
import '../../controller/register_controller.dart';
import '../../../../core/model/form_model.dart';
import '../../../../core/constant/sized_box.dart';
import '../../../../core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import '../../../../core/widget/text_widget/form_text.dart';
import '../widget_collection/add_location.dart';

class ContactDetailsWidget extends StatefulWidget {
  const ContactDetailsWidget({super.key});

  @override
  State<ContactDetailsWidget> createState() => _ContactDetailsWidgetState();
}

class _ContactDetailsWidgetState extends State<ContactDetailsWidget> {
  final controller = Get.put(RegisterController());
  final mapController = Get.put(AddLocation());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: controller.contactlFormkey,
            child: SizedBox(
              height: 400.h,
              child: ListView(scrollDirection: Axis.vertical, children: [
                FormText.registerText(
                    "Make it easier for customers to \nfind and reach you."),
                AppSizes.mediumHeightSizedBox,
                FormText.textFieldLabel("Phone Number"),
                FormWidget(
                  login: FormModel(
                      onTap: () {},
                      enableText: false,
                      controller: controller.phoneNumber,
                      hintText: AppConst.phoneNumber,
                      icon: const Icon(Icons.phone),
                      invisible: false,
                      validator: (email) => controller.validPhoneNumber(email),
                      type: TextInputType.number,
                      inputFormat: [controller.maskFormatterPhone]),
                  color: AppColor.secondaryScaffoldBacground,
                ),
                AppSizes.smallHeightSizedBox,
                FormText.textFieldLabel("Address"),
                FormWidget(
                  login: FormModel(
                      onTap: () {},
                      enableText: false,
                      controller: controller.address,
                      hintText: "Address",
                      icon: const Icon(Icons.location_on),
                      invisible: false,
                      validator: (address) => controller.validateAddress(),
                      type: TextInputType.streetAddress,
                      inputFormat: null),
                  color: AppColor.secondaryScaffoldBacground,
                ),
                AppSizes.smallHeightSizedBox,
                FormText.textFieldLabel("Coordanits"),
                Theme(
                  data: Theme.of(context).copyWith(
                      inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: AppColor.secondaryScaffoldBacground,
                  )),
                  child: TextFormField(
                      readOnly: true,
                      validator: (email) => controller.vaildatePassword(email),
                      onTap: () => Get.to(const MapWidget()),
                      controller: mapController.coordinate,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.secondaryScaffoldBacground),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.r))),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.secondaryScaffoldBacground),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.r))),
                          hintText: "Select File")),
                ),
              ]),
            )),
      ],
    );
  }
}
