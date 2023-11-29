import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constant/app_constant.dart';
import '../../../../constant/color.dart';
import '../../../text_widget/form_text.dart';
import '../profile_partial/profile_dialoge.dart';

final controller = Get.put(registerController);
dropDown() {
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
