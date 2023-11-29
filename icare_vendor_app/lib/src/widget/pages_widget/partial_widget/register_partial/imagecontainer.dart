import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/color.dart';

class ImageWidegt {
  static imageContainer(Widget widget, VoidCallback onTap) {
    return Stack(
      children: [
        Container(
            height: 120.h,
            width: 350.w,
            decoration: BoxDecoration(
              color: ColorConstants.secondaryScaffoldBacground,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: widget),
        Positioned(
          top: 10,
          right: 10,
          child: InkWell(
            onTap: onTap,
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
