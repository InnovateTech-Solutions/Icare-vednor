import 'package:flutter/material.dart';

import '../../../../feature/review/model/review_model.dart';
import '../../../constant/sized_box.dart';
import '../../text_widget/service_text.dart';

reviewContainer(ReviewModel reviewModel) {
  return Row(
    children: [
      CircleAvatar(
          radius: 40, // Adjust the radius as needed
          backgroundImage: NetworkImage(reviewModel.image)),
      AppSizes.smallWidthSizedBox,
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ServiceText.serviceText(reviewModel.name),
          AppSizes.smallHeightSizedBox,
          ServiceText.serviceText(reviewModel.comment),
        ],
      ),
      AppSizes.mediumWidthSizedBox,
    ],
  );
}
