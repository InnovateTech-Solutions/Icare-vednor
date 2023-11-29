import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../text_widget/service_text.dart';

void showServiceDetailsDialog(BuildContext context, String mainText,
    String description, String duration, String price) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: ServiceText.serviceText(mainText),
        content: SizedBox(
          height: 150.h,
          width: 200.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServiceText.descriptionText(description),
              Row(
                children: [
                  ServiceText.serviceText("Duration : "),
                  ServiceText.descriptionText(duration),
                  const Spacer(),
                  ServiceText.serviceText("Price : "),
                  ServiceText.descriptionText(price),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
