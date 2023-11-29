import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color.dart';
import '../../../model/profile_model.dart';
import '../../../view/forms/addservices_page.dart';
import '../../text_widget/form_text.dart';
import '../../text_widget/profile_text.dart';

final Color selectedColor = ColorConstants.backProductButton;
final selectedContainers = <String>[].obs;

class ConstantWidget {
  static constDivider() {
    return Divider(
      thickness: 3,
      color: ColorConstants.secondaryScaffoldBacground,
      indent: 20,
      endIndent: 30,
    );
  }

  static serviceFloatingButton() {
    return ClipOval(
      child: GestureDetector(
        onTap: () {
          Get.to(const AddServicePage());
        },
        child: Container(
          width: 60,
          height: 60,
          color: ColorConstants.mainTextColor,
          child: Center(
              child: Icon(
            Icons.add,
            color: ColorConstants.secondaryScaffoldBacground,
          )),
        ),
      ),
    );
  }

  static addServiceButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.secondaryScaffoldBacground,
        ),
        child: Center(
          child: FormText.textFieldLabel("Add"),
        ),
      ),
    );
  }

  static profileList(ProfileModel profileModel) {
    return InkWell(
      onTap: profileModel.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileText.mainProfileText(profileModel.title),
          Icon(
            Icons.arrow_right_outlined,
            color: ColorConstants.mainTextColor,
          ),
        ],
      ),
    );
  }

  static dayWidget(String title) {
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
              child: FormText.textFieldLabel(title),
            ),
          );
        }),
      ),
    );
  }

  static dontHaveAccountRow() {
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
}
