import 'package:get/get.dart';

class AddWorkingDays extends GetxController {
  static AddWorkingDays get instance => Get.find();
  final selectedContainers = <String>[].obs;

  selectAday(title) {
    if (selectedContainers.contains(title)) {
      selectedContainers.remove(title);
      update();
    } else {
      selectedContainers.add(title);
      update();
    }
  }
}
