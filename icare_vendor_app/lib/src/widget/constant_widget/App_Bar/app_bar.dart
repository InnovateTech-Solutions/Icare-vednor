import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';

class Appbar {
  static firstAppBar() {
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

  profileAppBar() {
    return AppBar(
      backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorConstants.mainTextColor),
    );
  }
}
