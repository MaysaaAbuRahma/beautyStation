

import 'package:get/get.dart';

class BeautyController extends GetxController {
  var searchQuery = ''.obs;
  var selectedButtonIndex = 1.obs;

  final List<String> buttonTitles = [
    'ابحث هنا',
    ' الكل',
    ' قص شعر',
    ' تنظيف بشرة',
    'أظافر',
    'مكياج',
  ];

  var beautyCenters = <Map<String, String>>[
    {
      'image': 'images/splash.jpg',
      'title': 'Splash Beauty Salon',
      'services': 'قص شعر، مكياج، مساج',
      'location': 'الرياض',
    },
    {
      'image': 'images/eva.jpg',
      'title': 'Eva Noria',
      'services': 'تنظيف بشرة، أظافر',
      'location': 'جدة',
    },
    {
      'image': 'images/chiffon.jpg',
      'title': 'Chiffon Center',
      'services': 'قص شعر، مساج',
      'location': 'الدمام',
    },
   
  ].obs;

  List<Map<String, String>> get filteredCenters {
    return beautyCenters.where((center) {
      final query = searchQuery.value.trim();
      final matchQuery = center['title']!.contains(query) ||
          center['services']!.contains(query);

      if (selectedButtonIndex.value <= 1) return matchQuery;

      final filter = buttonTitles[selectedButtonIndex.value].trim();
      return center['services']!.contains(filter) && matchQuery;
    }).toList();
  }

  void updateSearch(String value) => searchQuery.value = value;
  void selectButton(int index) => selectedButtonIndex.value = index;
}
