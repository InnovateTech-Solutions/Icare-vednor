import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/usecase/authentication/authentication_repository.dart';

import '../../../core/constant/sized_box.dart';
import '../../../core/model/form_model.dart';
import '../../../core/widget/constant_widget/const_widget/constant_widget.dart';
import '../../../core/widget/text_widget/form_text.dart';
import '../../../core/widget/text_widget/service_text.dart';
import '../../../core/widget/widget_collection/custom_widget.dart/form_widget.dart';
import '../controller/services_controller.dart';
import '../model/containter_model.dart';

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
                      login: FormModel(
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
                    ),
                    AppSizes.smallHeightSizedBox,
                    FormText.textFieldLabel("Description"),
                    FormWidget(
                      login: FormModel(
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
                    ),
                    AppSizes.smallHeightSizedBox,
                    FormText.textFieldLabel("Price"),
                    FormWidget(
                      login: FormModel(
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
                    ),
                    AppSizes.smallHeightSizedBox,
                    FormText.textFieldLabel("Duration"),
                    FormWidget(
                      login: FormModel(
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
                    ),
                    AppSizes.largeHeightSizedBox,
                  ],
                ),
              ),
            ),
            ConstantWidget.addServiceButton(() {
              AuthenticationRepository().logout();
              controller.addService(ContainerModel(
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
