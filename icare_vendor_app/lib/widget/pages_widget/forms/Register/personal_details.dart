import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/constant/app_constant.dart';
import 'package:icare_vendor_app/constant/color.dart';
import 'package:icare_vendor_app/model/login_model.dart';
import 'package:icare_vendor_app/widget/constant_widget/sizes/sized_box.dart';
import 'package:icare_vendor_app/widget/custom_widget.dart/form_widget.dart';
import 'package:icare_vendor_app/widget/text_widget/form_text.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../getx/register_controller.dart';

class PersonalDetailWidget extends StatefulWidget {
  const PersonalDetailWidget({super.key});

  @override
  State<PersonalDetailWidget> createState() => _PersonalDetailWidgetState();
}

class _PersonalDetailWidgetState extends State<PersonalDetailWidget> {
  final controller = Get.put(RegisterController());
  File? selectImage;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SizedBox(
      height: 450.h,
      child: ListView(children: [
        registerText("Enter your basic information to create your account"),
        AppSizes.mediumHeightSizedBox,
        textFieldLabel("Add Your Business Image"),
        Stack(
          children: [
            Container(
                height: 120.h,
                width: 320.w,
                decoration: BoxDecoration(
                  color: ColorConstants.secondaryScaffoldBacground,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: selectImage != null
                    ? Image.file(
                        selectImage!,
                        fit: BoxFit.cover,
                      )
                    : null),
            Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                onTap: () => pickImage(),
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
        AppSizes.smallHeightSizedBox,
        textFieldLabel("Category"),
        Obx(
          () => dropDown(),
        ),
        AppSizes.smallHeightSizedBox,
        textFieldLabel("Description"),
        FormWidget(
            login: Login(
          onTap: () {},
          controller: controller.vendorName,
          enableText: false,
          hintText: "Description",
          icon: const Icon(Icons.email),
          invisible: false,
          validator: (email) => controller.validateVendorName(email),
          type: TextInputType.emailAddress,
          onChange: null,
          inputFormat: null,
        )),
      ]),
    ));
  }

  Container dropDown() {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          color: ColorConstants.secondaryScaffoldBacground),
      child: DropdownButton<String>(
        isExpanded: true,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.r),
        value: controller.selectedItem.value == ""
            ? null
            : controller.selectedItem.value,
        onChanged: (newValue) {
          controller.upDateSelectedItem(newValue.toString());
        },
        items: AppConst.dropDownList.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: textFieldLabel(
              value,
            ),
          );
        }).toList(),
      ),
    );
  }

  Future pickImage() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 150.h,
      maxWidth: 500.w,
      imageQuality: 75,
    );
    final imagPath = File(file!.path);

    // ignore: unnecessary_null_comparison
    if (file == null) return;
    setState(() {
      selectImage = imagPath;
    });
  }
}
