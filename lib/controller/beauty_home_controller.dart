import 'package:get/get.dart';

class BeautyHomeController extends GetxController {
  // المدن
  final cities = [
    'الرياض',
    'جدة',
    'الدمام',
    'الخبر',
    'مدينة الملك عبد الله الاقتصادية',
    'عرض المزيد',
  ].obs;

  // اختيار المدينة الحالية
  var selectedCity = ''.obs;

  // عدد المواعيد اليوم
  var bookedAppointments = 389041.obs;
final salons = [
  {
    'name': 'Léa HD Beauty Concept',
    'rating': '4.9',
    'reviews': '4,026',
    'location': 'Amir Mouaaddam, Tunis',
    'service': 'علاجات التجميل',
  },
  {
    'name': 'Machi Xinary',
    'rating': '5.0',
    'reviews': '3,201',
    'location': 'Chrysoupolis, Nicosia',
    'service': 'منتجات صحية وسبا',
  },
  {
    'name': 'Beauty in the City',
    'rating': '5.0',
    'reviews': '433',
    'location': 'Lykavittos, Μεσογείων Λεωφόρος',
    'service': 'علاجات التجميل',
  },
].obs;
final recommendedSalons = [
  {
    'name': 'Léa HD Beauty Concept',
    'rating': '4.9',
    'reviews': '4,026',
    'location': 'Amir Mouaaddam, Tunis',
    'service': 'علاجات التجميل',
  },
  {
    'name': 'Machi Xinary',
    'rating': '5.0',
    'reviews': '3,201',
    'location': 'Chrysoupolis, Nicosia',
    'service': 'منتجات صحية وسبا',
  },
  {
    'name': 'Beauty in the City',
    'rating': '5.0',
    'reviews': '433',
    'location': 'Lykavittos, Μεσογείων Λεωφόρος',
    'service': 'علاجات التجميل',
  },
].obs;

  // خيارات البحث
  // final searchOptions = [
  //   'جميع العيادات والمراكز',
  //   'الموقع الحالي',
  //   'أي تاريخ',
  //   'أي وقت',
  // ].obs;

  // خدمات اليوم
  final services = [
    {
      'title': 'مراكز التجميل',
      'subtitle': 'اكتشف أفضل مراكز التجميل القريبة منك واحجز موعدك بكل سهولة عبر تطبيق بيوتي ستيشن.',
      'image': 'images/logo2.jpg'
    },
    {
      'title': 'مركز طبي',
      'subtitle': 'احجز موعدك في المراكز الطبية المعتمدة لتحسين صحتك والحصول على أفضل استشارة طبية.',
      'image': 'images/logo3.jpg'
    },
    {
      'title': 'مستحضرات التجميل',
      'subtitle': 'تسوق أحدث مستحضرات التجميل والعناية بالبشرة والشعر مع خدمة توصيل سريعة.',
      'image': 'images/logo4.jpg'
    },
  ].obs;

  // العروض
  final offers = [
    {
      'discount': '40%',
      'title': 'مانيكير + باديكير جل',
      'salon': 'Beauty in the City',
      'location': 'الخبر',
      'oldPrice': '300',
      'newPrice': '180',
      'buttonText': 'احجز الآن',
    },
    {
      'discount': '25%',
      'title': 'تنظيف بشرة عميق + ماسك',
      'salon': 'DG Beauty',
      'location': 'جدة',
      'oldPrice': '240',
      'newPrice': '180',
      'buttonText': 'احصل على العرض',
    },
    {
      'discount': '30%',
      'title': 'باقة قص + صبغة + عناية',
      'salon': 'Tania S صالون',
      'location': 'الرياض',
      'oldPrice': '380',
      'newPrice': '266',
      'buttonText': 'احجز العرض الآن',
    },
  ].obs;

  // صالونات الأكثر رواجاً
  final popularSalons = [
    {
      'name': 'Léa HD Beauty Concept',
      'rating': '4.9',
      'reviews': '4,026',
      'location': 'Amir Mouaaddam, Tunis',
      'service': 'علاجات التجميل',
    },
    {
      'name': 'Machi Xinary',
      'rating': '5.0',
      'reviews': '3,201',
      'location': 'Chrysoupolis, Nicosia',
      'service': 'منتجات صحية وسبا',
    },
    {
      'name': 'Beauty in the City',
      'rating': '5.0',
      'reviews': '433',
      'location': 'Lykavittos, Μεσογείων Λεωφόρος',
      'service': 'علاجات التجميل',
    },
  ].obs;

  // التعليقات
  final reviews = [
    {
      'rating': '5',
      'title': 'رائعة للعثور على حلاقين',
      'comment': 'أفضل منصة حجز استخدمتها! أحب بها بساطة الحجز وسهولة الاستخدام...',
      'userName': 'دليل',
      'userLocation': 'مدينة أستراليا',
      'userImage': 'images/logo4.jpg',
    },
    {
      'rating': '5',
      'title': 'سهل الاستخدام والاستكشافات',
      'comment': 'تطبيقات بيوتي تتيح الحياة أسهل بكثير...',
      'userName': 'دان',
      'userLocation': 'نيويورك، الولايات المتحدة',
      'userImage': 'images/logo4.jpg',
    },
    {
      'rating': '5',
      'title': 'أفضل نظام حجز',
      'comment': 'نحن نحب أن نحجز بأسهل طريقة...',
      'userName': 'أوبس',
      'userLocation': 'بندي المملكة المتحدة',
      'userImage': 'images/logo4.jpg',
    },
  ].obs;

  void selectCity(String city) {
    selectedCity.value = city;
  }

  void incrementAppointments() {
    bookedAppointments.value++;
  }
}
