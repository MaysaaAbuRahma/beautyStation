import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CityAreasController extends GetxController {
  late GoogleMapController mapController;

  final Map<String, List<String>> cityAreas = {
    'الرياض': [
      'الدرعية', 'التخصصي', 'الروابي', 'الازدهار', 'السويدي', 'العريجاء',
      'الملقا', 'المونسية', 'النرجس', 'الياسمين', 'اليرموك', 'قرطبة',
      'النسم', 'الوادي', 'العقيق', 'العليا', 'المروج', 'ظهرة لبن', 'تمار', 'غدير'
    ],
    'جدة': ['الروضة', 'السلامة', 'النسيم', 'الحمراء', 'الفيحاء', 'الصفا'],
    'الدمام': ['الريان', 'الشاطئ', 'الروضة', 'المنار'],
    'الخبر': ['العقربية', 'البندرية', 'الراكة', 'الكورنيش'],
    'مدينة الملك عبد الله الاقتصادية': ['البيلسان', 'المروج', 'الشاطئ'],
  };

  final Map<String, LatLng> cityCoordinates = {
    'الرياض': LatLng(24.7136, 46.6753),
    'جدة': LatLng(21.4858, 39.1925),
    'الدمام': LatLng(26.4207, 50.0888),
    'الخبر': LatLng(26.2172, 50.1971),
    'مدينة الملك عبد الله الاقتصادية': LatLng(22.3923, 39.1253),
  };

  var selectedCity = ''.obs;
  var searchQuery = ''.obs;

  List<String> get filteredAreas {
    final areas = cityAreas[selectedCity.value] ?? [];
    if (searchQuery.value.isEmpty) return areas;
    return areas
        .where((a) =>
            a.contains(searchQuery.value) ||
            a.startsWith(searchQuery.value))
        .toList();
  }

  LatLng get cityPosition =>
      cityCoordinates[selectedCity.value] ?? const LatLng(24.7136, 46.6753);

  void selectCity(String city) {
    selectedCity.value = city;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  void initCity(String cityName) {
    selectedCity.value = cityName;
  }
}
