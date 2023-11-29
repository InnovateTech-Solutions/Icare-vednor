import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../getx/review_controller.dart';
import '../../constant_widget/const_wiidget/constant_widget.dart';
import '../../constant_widget/sizes/sized_box.dart';
import '../../custom_widget.dart/navbar_custom/review_container.dart';
import '../../text_widget/form_text.dart';
import '../../text_widget/profile_text.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 18.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileText.mainProfileText("Reviews & Comments"),
          ConstantWidget.constDivider(),
          AppSizes.mediumHeightSizedBox,

          Obx(() => controller.review.isEmpty
              ? Center(
                  child: FormText.mainText("There is No Review"),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FormText.textFieldLabel("4.5"),
                          AppSizes.xsmallWidthSizedBox,
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          AppSizes.xsmallWidthSizedBox,
                          //number
                          FormText.textFieldLabel("(15)"),
                        ],
                      ),
                      AppSizes.mediumHeightSizedBox,
                      SizedBox(
                        width: 350.w,
                        height: 435.h,
                        child: ListView.separated(
                          itemCount: controller.review.length,
                          itemBuilder: ((context, index) {
                            return reviewContainer(controller.review[index]);
                          }),
                          separatorBuilder: (BuildContext context, int index) {
                            return AppSizes.smallHeightSizedBox;
                          },
                        ),
                      )
                    ],
                  ),
                )),
          //Rating
        ],
      ),
    );
  }
}
