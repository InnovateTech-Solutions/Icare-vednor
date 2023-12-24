import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  profileAppBar() {
    return AppBar(
      backgroundColor: AppColor.mainScaffoldBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.mainTextColor),
    );
  }
}
