
 import 'package:get/get.dart';
import 'package:omkcpa/models/service_model.dart';

class SalonDetailsController extends GetxController {
  var activeTabIndex = 0.obs;

  var services = <ServiceModel>[
    ServiceModel(title: 'قص + تسريحة', duration: '60 دقيقة', desc: 'شامبو/بلسم • استشارة'),
    ServiceModel(title: 'صبغة جذور', duration: '90 دقيقة', desc: 'منتجات عضوية'),
    ServiceModel(title: 'تنظيف بشرة عمق + ماسك', duration: '50 دقيقة', desc: 'جهاز بخار • مناسبة لجميع البشرات'),
  ].obs;

  var similarCenters = [
    {'image': 'images/logo4.jpg', 'name': 'صالون اللمسة الراقية', 'rating': '4.8', 'city': 'الرياض'},
    {'image': 'images/logo2.jpg', 'name': 'صالون أناقة الشرق', 'rating': '4.7', 'city': 'جدة'},
    {'image': 'images/logo3.jpg', 'name': 'صالون فخامة الجمال', 'rating': '4.9', 'city': 'الدمام'},
  ].obs;

  void changeTab(int index) {
    activeTabIndex.value = index;
  }
}
