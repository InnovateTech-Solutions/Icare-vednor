import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../widget/constant_widget/App_Bar/app_bar.dart';
import '../../widget/pages_widget/profile/review_widget.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
        appBar: Appbar.firstAppBar(),
        body: const Center(
          child: ReviewWidget(),
        ),
      ),
    );
  }
}
