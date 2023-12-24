import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/widget/constant_widget/App_Bar/app_bar.dart';
import '../../profile/widget/review_widget.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainScaffoldBackgroundColor,
        appBar: Appbar.firstAppBar(),
        body: const Center(
          child: ReviewWidget(),
        ),
      ),
    );
  }
}
