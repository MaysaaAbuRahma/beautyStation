import 'package:get/get.dart';

class GenderController extends GetxController {
  RxString selectedCategory = ''.obs;

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  bool get hasSelection => selectedCategory.isNotEmpty;
}
