import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';
import '../../../getx/services_controller.dart';
import '../../../model/login_model.dart';
import '../../../model/servicescontainter_model.dart';
import '../../constant_widget/const_wiidget/constant_widget.dart';
import '../../constant_widget/sizes/sized_box.dart';
import '../../custom_widget.dart/form_widget.dart';
import '../../text_widget/form_text.dart';
import '../../text_widget/service_text.dart';

class AddServiceWidget extends StatefulWidget {
  const AddServiceWidget({super.key});

  @override
  State<AddServiceWidget> createState() => _AddServiceWidgetState();
}

class _AddServiceWidgetState extends State<AddServiceWidget> {
  final controller = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ServiceText.mainHomeText("Add Service"),
            ConstantWidget.constDivider(),
            AppSizes.smallHeightSizedBox,
            SizedBox(
              height: 400.h,
              width: 350.w,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    FormText.textFieldLabel("Service"),
                    FormWidget(
                      login: Login(
                        onTap: () {},
                        controller: controller.service,
                        enableText: false,
                        hintText: "Service",
                        icon: const Icon(Icons.email),
                        invisible: false,
                        validator: (service) => controller.validateService(),
                        type: TextInputType.emailAddress,
                        inputFormat: null,
                      ),
                      color: ColorConstants.secondaryScaffoldBacground,
                    ),
                    AppSizes.smallHeightSizedBox,
                    FormText.textFieldLabel("Description"),
                    FormWidget(
                      login: Login(
                        onTap: () {},
                        controller: controller.description,
                        enableText: false,
                        hintText: "Description",
                        icon: const Icon(Icons.email),
                        invisible: false,
                        validator: (description) =>
                            controller.validateDescription(description!),
                        type: TextInputType.emailAddress,
                        inputFormat: null,
                      ),
                      color: ColorConstants.secondaryScaffoldBacground,
                    ),
                    AppSizes.smallHeightSizedBox,
                    FormText.textFieldLabel("Price"),
                    FormWidget(
                      login: Login(
                        onTap: () {},
                        controller: controller.price,
                        enableText: false,
                        hintText: "Price",
                        icon: const Icon(Icons.email),
                        invisible: false,
                        validator: (price) => controller.validatePrice(),
                        type: TextInputType.emailAddress,
                        inputFormat: null,
                      ),
                      color: ColorConstants.secondaryScaffoldBacground,
                    ),
                    AppSizes.smallHeightSizedBox,
                    FormText.textFieldLabel("Duration"),
                    FormWidget(
                      login: Login(
                        onTap: () {},
                        controller: controller.duration,
                        enableText: false,
                        hintText: "Duration",
                        icon: const Icon(Icons.email),
                        invisible: false,
                        validator: (duration) => controller.validateDuration(),
                        type: TextInputType.number,
                        inputFormat: null,
                      ),
                      color: ColorConstants.secondaryScaffoldBacground,
                    ),
                    AppSizes.largeHeightSizedBox,
                  ],
                ),
              ),
            ),
            ConstantWidget.addServiceButton(() {
              controller.addService(ServicesContainerModel(
                  mainLabel: controller.service.text,
                  description: controller.description.text,
                  price: controller.price.text,
                  duration: controller.duration.text));
            })
          ],
        ),
      ),
    );
  }
}
