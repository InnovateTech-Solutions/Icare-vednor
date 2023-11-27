import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/constant/app_constant.dart';
import 'package:icare_vendor_app/getx/register_controller.dart';
import 'package:icare_vendor_app/model/login_model.dart';
import 'package:icare_vendor_app/widget/constant_widget/sizes/sized_box.dart';
import 'package:icare_vendor_app/widget/custom_widget.dart/form_widget.dart';
import 'package:icare_vendor_app/widget/pages_widget/forms/Register/test.dart';
import 'package:icare_vendor_app/widget/text_widget/form_text.dart';

class ContactDetailsWidget extends StatefulWidget {
  const ContactDetailsWidget({super.key});

  @override
  State<ContactDetailsWidget> createState() => _ContactDetailsWidgetState();
}

class _ContactDetailsWidgetState extends State<ContactDetailsWidget> {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
              child: SizedBox(
            height: 400.h,
            child: ListView(children: [
              registerText(
                  "Make it easier for customers to \nfind and reach you."),
              AppSizes.mediumHeightSizedBox,
              textFieldLabel("Phone Number"),
              FormWidget(
                  login: Login(
                      onTap: () {},
                      enableText: false,
                      controller: controller.phoneNumber,
                      hintText: AppConst.phoneNumber,
                      icon: const Icon(Icons.phone),
                      invisible: false,
                      validator: (email) => controller.vaildPhoneNumber(email),
                      type: TextInputType.number,
                      onChange: null,
                      inputFormat: [controller.maskFormatterPhone])),
              AppSizes.smallHeightSizedBox,
              textFieldLabel("Address"),
              FormWidget(
                login: Login(
                    onTap: () {},
                    enableText: false,
                    controller: controller.address,
                    hintText: "Address",
                    icon: const Icon(Icons.location_city),
                    invisible: false,
                    validator: (email) => controller.validateVendorName(email),
                    type: TextInputType.streetAddress,
                    onChange: null,
                    inputFormat: null),
              ),
              AppSizes.smallHeightSizedBox,
              textFieldLabel("Coordanits"),
              FormWidget(
                login: Login(
                    onTap: () {
                      Get.to(const SearchPlacesScreen());
                    },
                    enableText: true,
                    controller: controller.address,
                    hintText: "Coordanits",
                    icon: const Icon(Icons.location_city),
                    invisible: false,
                    validator: (email) => controller.validateVendorName(email),
                    type: TextInputType.streetAddress,
                    onChange: null,
                    inputFormat: null),
              ),
            ]),
          )),
        ),
      ],
    );
  }
}
