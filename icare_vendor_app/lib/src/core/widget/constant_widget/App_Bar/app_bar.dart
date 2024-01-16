import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color.dart';

class Appbar {
  static firstAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColor.mainScaffoldBackgroundColor,
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
                color: AppColor.mainTextColor,
              ))
        ],
      ),
    );
  }

  static secAppBar(String title) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColor.mainScaffoldBackgroundColor,
      elevation: 0,
      centerTitle: true,
      title: Text(title,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w700))),
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
              ))
        ],
      ),
    );
  }

  profileAppBar() {
    return AppBar(
      backgroundColor: AppColor.mainScaffoldBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.mainTextColor),
    );
  }
}
