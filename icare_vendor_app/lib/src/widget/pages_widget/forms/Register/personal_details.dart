import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constant/app_constant.dart';
import '../../../../constant/color.dart';
import '../../../../getx/register_controller.dart';
import '../../../../model/login_model.dart';
import '../../../constant_widget/sizes/sized_box.dart';
import '../../../custom_widget.dart/form_widget.dart';
import '../../../text_widget/form_text.dart';
import '../../partial_widget/register_partial/imagecontainer.dart';

class PersonalDetailWidget extends StatefulWidget {
  const PersonalDetailWidget({super.key});

  @override
  State<PersonalDetailWidget> createState() => _PersonalDetailWidgetState();
}

class _PersonalDetailWidgetState extends State<PersonalDetailWidget> {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.personalFormkey,
        child: SizedBox(
          height: 450.h,
          child: ListView(children: [
            FormText.registerText(
                "Enter your basic information to create your account"),
            AppSizes.mediumHeightSizedBox,
            FormText.textFieldLabel("Add Your Business Image"),
            ImageWidegt.imageContainer(
                controller.selectImage != null
                    ? Image.file(
                        controller.selectImage!,
                        fit: BoxFit.cover,
                      )
                    : FormText.textFieldLabel("Choose an image"), () {
              pickImage();
            }),
            AppSizes.smallHeightSizedBox,
            FormText.textFieldLabel("Category"),
            Obx(
              () => dropDown(),
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
                validator: (email) => controller.validateDescription(),
                type: TextInputType.emailAddress,
                inputFormat: null,
              ),
              color: ColorConstants.secondaryScaffoldBacground,
            ),
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
            child: FormText.textFieldLabel(
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

    setState(() {
      controller.selectImage = imagPath;
    });
  }
}
