import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/widget/constant_widget/const_widget/constant_widget.dart';
import 'package:icare_vendor_app/src/core/widget/text_widget/form_text.dart';
import 'package:icare_vendor_app/src/feature/register/controller/add_days.dart';

class AddDayes extends StatelessWidget {
  const AddDayes({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddWorkingDays());
    return GestureDetector(
      onTap: () {
        controller.selectAday(title);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Obx(() {
          final isSelected = controller.selectedContainers.contains(title);

          return Container(
            width: 95.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              color: isSelected
                  ? selectedColor
                  : AppColor.secondaryScaffoldBacground,
            ),
            child: Center(
              child: FormText.textFieldLabel(title),
            ),
          );
        }),
      ),
    );
    ;
  }
}
