import 'package:get/get.dart';

import '../model/review_model.dart';

class ReviewController extends GetxController {
  static ReviewController get instance => Get.find();

  RxList<ReviewModel> review = <ReviewModel>[
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
    ReviewModel(image: "image", name: "name", comment: "comment", rating: 5),
  ].obs;
}
