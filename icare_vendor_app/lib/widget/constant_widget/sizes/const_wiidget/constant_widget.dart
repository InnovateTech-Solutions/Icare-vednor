import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/widget/text_widget/form_text.dart';

import '../../../../constant/color.dart';

final Color selectedColor = ColorConstants.backProductButton;
final selectedContainers = <String>[].obs; // Use RxList from GetX

constDivider() {
  return Divider(
    thickness: 3,
    color: ColorConstants.secondaryScaffoldBacground,
    indent: 20,
    endIndent: 30,
  );
}

dayWidget(String title) {
  return GestureDetector(
    onTap: () {
      if (selectedContainers.contains(title)) {
        selectedContainers.remove(title);
      } else {
        selectedContainers.add(title);
      }
    },
    child: Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Obx(() {
        // Use Obx to listen for changes in selectedContainers
        final isSelected = selectedContainers.contains(title);

        return Container(
          width: 95.w,
          height: 70.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: isSelected
                ? selectedColor
                : ColorConstants.secondaryScaffoldBacground,
          ),
          child: Center(
            child: textFieldLabel(title),
          ),
        );
      }),
    ),
  );
}

dontHaveAccountRow() {
  return Padding(
    padding: EdgeInsets.only(top: 8.h),
    child: GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "don’t have account?",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                    color: ColorConstants.mainTextColor)),
          ),
          GestureDetector(
            child: Text(
              "Create one",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                      color: ColorConstants.mainTextColor)),
            ),
          )
        ],
      ),
    ),
  );
}
