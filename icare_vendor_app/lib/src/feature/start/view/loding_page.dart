import 'package:flutter/material.dart';
import 'package:icare_vendor_app/src/core/constant/color.dart';
import 'package:icare_vendor_app/src/core/constant/sized_box.dart';
import 'package:icare_vendor_app/src/core/widget/text_widget/loading_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            AppSizes.largeHeightSizedBox,
            loadingText(
                "Please wait while we process your request. Your vendor approval is pending."),
            AppSizes.mediumHeightSizedBox,
            LoadingAnimationWidget.inkDrop(
              size: 200,
              color: AppColor.mainTextColor,
            ),
          ],
        ),
      )),
    );
  }
}
