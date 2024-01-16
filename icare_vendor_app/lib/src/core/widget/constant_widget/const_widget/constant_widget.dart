import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/src/core/usecase/authentication/authentication_repository.dart';

import '../../../../feature/profile/model/profile_model.dart';
import '../../../constant/color.dart';
import '../../text_widget/form_text.dart';
import '../../text_widget/profile_text.dart';

const Color selectedColor = Color(0xffF5F5F5);
final selectedContainers = <String>[].obs;

class ConstantWidget {
  static constDivider() {
    return Divider(
      thickness: 3,
      color: AppColor.secondaryScaffoldBacground,
      indent: 20,
      endIndent: 30,
    );
  }

  static serviceFloatingButton() {
    return ClipOval(
      child: GestureDetector(
        onTap: () {
          AuthenticationRepository.instance.logout();
        },
        child: Container(
          width: 60,
          height: 60,
          color: AppColor.mainTextColor,
          child: Center(
              child: Icon(
            Icons.add,
            color: AppColor.secondaryScaffoldBacground,
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
          color: AppColor.secondaryScaffoldBacground,
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
            color: AppColor.mainTextColor,
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
          print(selectedContainers);
        } else {
          selectedContainers.add(title);
          print(selectedContainers);
        }
      },
      child: Obx(() {
        final isSelected = selectedContainers.contains(title);

        return Container(
          width: 81.w,
          height: 100.h,
          margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: isSelected ? AppColor.mainTextColor : selectedColor,
          ),
          child: Center(
            child: Text(title,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? selectedColor
                            : AppColor.mainTextColor))),
          ),
        );
      }),
    );
  }

  static dontHaveAccountRow(String question, String title, VoidCallback onTap) {
    return Text.rich(TextSpan(
        text: question,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: AppColor.fadeColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        children: [
          TextSpan(
              text: title,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: AppColor.mainTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ]));
  }
}
