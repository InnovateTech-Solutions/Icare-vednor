import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icare_vendor_app/constant/color.dart';

firstAppBar() {
  return AppBar(
    backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
    elevation: 0,
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: ColorConstants.mainTextColor,
              ))
        ],
      )
    ],
  );
}

secondAppBar() {
  return AppBar(
    backgroundColor: ColorConstants.secondaryScaffoldBacground,
    elevation: 0,
    centerTitle: true,
    title: Text(
      'Categorties',
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: ColorConstants.mainTextColor)),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: ColorConstants.mainTextColor,
              ))
        ],
      )
    ],
  );
}

thirdAppBar() {
  return AppBar(
    backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
    elevation: 0,
    leading: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorConstants.mainTextColor,
            ))
      ],
    ),
  );
}

productsAppBar(String title) {
  return AppBar(
    leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorConstants.mainTextColor,
        )),
    backgroundColor: ColorConstants.secondaryScaffoldBacground,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: ColorConstants.mainTextColor)),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: ColorConstants.mainTextColor,
              ))
        ],
      )
    ],
  );
}

profileAppBar() {
  return AppBar(
    backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
    elevation: 0,
    iconTheme: IconThemeData(color: ColorConstants.mainTextColor),
  );
}
