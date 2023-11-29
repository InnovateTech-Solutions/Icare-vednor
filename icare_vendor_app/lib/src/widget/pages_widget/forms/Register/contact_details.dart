import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constant/app_constant.dart';
import '../../../../constant/color.dart';
import '../../../../getx/map_controller.dart';
import '../../../../getx/register_controller.dart';
import '../../../../model/login_model.dart';
import '../../../constant_widget/sizes/sized_box.dart';
import '../../../custom_widget.dart/form_widget.dart';
import '../../../text_widget/form_text.dart';
import 'map_widget.dart';

class ContactDetailsWidget extends StatefulWidget {
  const ContactDetailsWidget({super.key});

  @override
  State<ContactDetailsWidget> createState() => _ContactDetailsWidgetState();
}

class _ContactDetailsWidgetState extends State<ContactDetailsWidget> {
  final controller = Get.put(RegisterController());
  final mapController = Get.put(MapController());

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
                  login: Login(
                      onTap: () {},
                      enableText: false,
                      controller: controller.phoneNumber,
                      hintText: AppConst.phoneNumber,
                      icon: const Icon(Icons.phone),
                      invisible: false,
                      validator: (email) => controller.validPhoneNumber(email),
                      type: TextInputType.number,
                      inputFormat: [controller.maskFormatterPhone]),
                  color: ColorConstants.secondaryScaffoldBacground,
                ),
                AppSizes.smallHeightSizedBox,
                FormText.textFieldLabel("Address"),
                FormWidget(
                  login: Login(
                      onTap: () {},
                      enableText: false,
                      controller: controller.address,
                      hintText: "Address",
                      icon: const Icon(Icons.location_on),
                      invisible: false,
                      validator: (address) => controller.validateAddress(),
                      type: TextInputType.streetAddress,
                      inputFormat: null),
                  color: ColorConstants.secondaryScaffoldBacground,
                ),
                AppSizes.smallHeightSizedBox,
                FormText.textFieldLabel("Coordanits"),
                Theme(
                  data: Theme.of(context).copyWith(
                      inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: ColorConstants.secondaryScaffoldBacground,
                  )),
                  child: TextFormField(
                      readOnly: true,
                      validator: (email) => controller.vaildatePassword(email),
                      onTap: () => Get.to(const MapWidget()),
                      controller: mapController.coordinate,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstants
                                      .secondaryScaffoldBacground),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.r))),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstants
                                      .secondaryScaffoldBacground),
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
