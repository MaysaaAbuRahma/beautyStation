import 'package:flutter/material.dart';


class AppConstants {
  //color
  static const Color primaryColor = Color(0xFF6B4B92);
  static const Color secondaryColor = Color(0xFF7E5BA6);
  static const Color backgroundColor = Colors.white;
  static const Color lightPurple = Color(0xFFF3ECF8);
  static const Color textColor = Colors.black87;
  static const Color greyColor = Colors.grey;
  static const Color amberColor = Colors.amber;
    static const Color lightGreyBackground = Color(0xFFF6F6F7);
  static const Color hintTextColor = Color(0xFF9A89B5);
  static const Color pinkAccent= Colors.pinkAccent;
  //padding margin
  static const double defaultPadding = 20.0;
  static const double sectionSpacing = 40.0;
  static const double cornerRadius = 16.0;

  //string
  static const String appName = 'بيوتي ستيشن';
  static const String description =   'احجزي مواعيدكِ بسهولة وتمتعي بأفضل خدمات التجميل والعناية عبر تطبيق بيوتي ستيشن.';
  static const String appSlogan = 'احجزي مواعيدكِ بسهولة وتمتعي بأفضل خدمات التجميل والعناية.';
  static const String websiteBannerText = 'زوروا موقعنا الالكتروني واستمتعوا بخدماتنا';
  static const String searchHeadline = 'منصة لحجز مراكز التجميل و تحسين الصحة القريبة منك';
  static const String servicesTitle = 'وش حاب تطلب اليوم؟';
  static const String offersTitle = 'عروضات بيوتي ستيشن';
  static const String popularSalonsTitle = 'الأكثر رواجاً';
  static const String reviewsTitle = 'التعليقات';
  static const String recommendationsTitle = 'توصياتنا';
  static const String citiesTitle = 'المناطق التي نخدمها';
  static const String bookedTodayText = 'موعد محجوز اليوم';
  static const String citiesSubtitle =
      'نوفر خدمات بيوتي ستيشن في مختلف المدن الرئيسية داخل المملكة لتكون أقرب إليك دائمًا.';
  static const String search = 'بحث';
  static const String learnMore = 'اعرف المزيد';
   static const String joinUs = 'انضم الينا';
   static const String RegisterAsAServiceQwner = 'سجل كصاحب خدمة';
   static const String RegisterNow = 'سجل الان';
   static const String Home = 'الرئيسية';
   static const String About ='من نحن';
   static const String Salons ='الصالونات';
   static const String Services='الخدمات';
   static const String Contact='تواصل معنا';
   static const String AllBeautyCenters='كل مراكز التجميل';
   static const String sectionSubtitle =
      'استعرضي أفضل مراكز التجميل القريبة منك\nواحجزي موعدك بسهولة مع أفضل الخدمات.';
  static const String searchHint = 'ابحث هنا';
  static const String noResultsText = 'لا توجد نتائج مطابقة';
  static const String bookNow = 'احجز الآن';
    static const String details = 'التفاصيل';
     static const String myBookingsTitle = 'مواعيدي';
  static const String sortByFurthest = 'الأبعد أولاً';
  static const String sortByNearest = 'الأقرب أولاً';
  static const String SearchBySalonOrServiceName = 'ابحث باسم الصالون أو الخدمة';
  static const String noBookingsFound = 'لا توجد حجوزات مطابقة لبحثك';
  static const String bookedToday = 'موعد محجوز اليوم';
   static const String otherCities = 'مدن أخرى';
  static const String neighborhoodSearchHint =
      'ابحث عن حي... (مثلاً: النرجس، الندى، الروضة)';
  static const String mapTitle = 'الموقع على الخريطة';
  static const String foundAreasInCity = 'الأحياء التي تم العثور عليها في';
  static const String areaCountSuffix = 'حي';
    static const String loginTitle = 'تسجيل الدخول';
  static const String welcomeBack = 'مرحبًا بك👋';
  static const String loginSubtitle = 'سجّل الدخول لمتابعة حجز المواعيد بسهولة';
  static const String emailLabel = 'البريد الإلكتروني';
  static const String passwordLabel = 'كلمة المرور';
  static const String loginButton = 'تسجيل الدخول';
  static const String noAccountText = 'ليس لديك حساب؟ ';
  static const String createAccountText = 'إنشاء حساب جديد';
  static const String createAccount = 'إنشاء حساب ';
   static const String chooseService = 'اختر خدمة';
  static const String readyToBook = 'جاهز للحجز؟';
  static const String title = "تسجيل مركز جديد";
  static const String headerText =
      "املأ البيانات التالية لنراجع طلبك ونتفعل على بيـوتي ستيشن.";

  static const String sectionBusinessInfo = "معلومات المنشأة";
  static const String sectionContactInfo = "معلومات التواصل";
  static const String sectionLocation = "الموقع";
  static const String sectionAttachments = "مرفقات";

  static const String centerNameLabel = "اسم المركز *";
  static const String centerNameHint = "مثال: صالون لمسة جمال";

  static const String commercialRegLabel = "رقم السجل التجاري (اختياري)";
  static const String commercialRegHint = "مثلاً 123456";

  static const String businessTypeLabel = "نوع المنشأة *";
  static const List<String> businessTypes = ["صالون", "سبا", "عيادة"];

  static const String descriptionLabel = "نبذة قصيرة";
  static const String descriptionHint = "وصف مختصر بالخدمات";

  static const String phoneLabel = "جوال الحجز *";
  static const String phoneHint = "05xxxxxxxx";

  static const String whatsappLabel = "واتساب (اختياري)";
  static const String whatsappHint = "05xxxxxxxx";

  static const String emailHint = "name@example.com";

  static const String websiteLabel = "الموقع الإلكتروني (اختياري)";
  static const String websiteHint = "https://...";

  static const String cityLabel = "المدينة *";
  static const List<String> cityOptions = ["الرياض", "جدة", "الدمام", "مكة"];

  static const String areaLabel = "الحي *";
  static const String areaHint = "مثلاً: الياسمين";

  static const String addressLabel = "العنوان التفصيلي *";
  static const String addressHint = "وصف العنوان بدقة";

  static const String mapLinkLabel = "رابط خرائط جوجل (اختياري)";
  static const String mapLinkHint = "https://maps.google.com/...";

  static const String fileCommercialLabel = "ملف السجل التجاري (PDF)";
  static const String fileTaxLabel = "شهادة الضريبة (PDF)";
  static const String fileNationalAddressLabel = "العنوان الوطني (PDF)";
  static const String fileVatLabel = "ضريبة القيمة المضافة (PDF)";
  static const String ChooseYourCategoty = "اختر الفئة الخاصة بك";
  static const String male = "رجال";
  static const String female = "نساء";
  static const String getStarted = "هيا لنبدأ";
   static const String welcomeTitle = "أهلاً بك 👋";
  static const String welcomeSubtitle =
      "أنشئ حسابك للبدء باستخدام تطبيق بيوتي ستيشن بسهولة";

  static const String fullNameLabel = "الاسم الكامل";
    static const String statusConfirmed = 'مؤكد';
  static const String statusPaid = 'مدفوع';
  static const String statusUnpaid = 'غير مدفوع';
  static const String cancelLabel = 'إلغاء';
  static const String rescheduleLabel = 'إعادة الجدولة';
  static const String detailsLabel = 'التفاصيل';
  static const String agreementText = "أوافق على شروط الخدمة و سياسة الخصوصية";
  static const String submitButtonText = "إرسال الطلب";
  static const String contactSoonText = "سنعاود الاتصال بك قريبًا";
    static const String location = 'الموقع';
  static const String workingHours = 'ساعات العمل';
  static const String contact = 'التواصل';
  static const String similarCenters = 'مراكز مشابهة';
   static const String profileScreen = 'الملف الشخصي';

  // Working hours
  static const String sunThuHours = 'الأحد - الخميس: 9:00 ص - 9:00 م';
  static const String friHours = 'الجمعة: مغلق';
  static const String satHours = 'السبت: 10:00 ص - 8:00 م';

  // // Contact
  // static const String phone = 'جوال: 0501234567';
  // static const String whatsapp = 'واتساب: 0501234567';
  // static const String telegram = 'تليجرام: @beautysalon';

  // Header
  // static const String salonName = 'صالون لمسة جمال';
  // static const String ratingText = '4.9 ★ (433)';
  // static const String city = 'الرياض • حي الياسمين';
  // static const String service1 = 'قص شعر';
  // static const String service2 = 'تنظيف بشرة';
  // static const String service3 = 'مكياج';
   static const String share = 'مشاركة';
 static const String addToFavorites = 'أضف للمفضلة ♥';

  // Tabs
  static const List<String> tabs = ['الخدمات', 'نبذة', 'الفريق', 'التقييمات', 'الموقع'];

  // Services list
  static const String servicesList = 'قائمة الخدمات';
  static const String noServices = 'لا توجد خدمات حالياً';
  static const String serviceButton = 'خدمة';

  // About & Reviews
  static const String aboutTitle = 'نبذة عن المركز';
  static const String reviews = 'التقييمات';
  static const String sendReview = 'إرسال التقييم';
  static const String overallRating = '4.9';

  //image
  static const String logo = 'images/logo.png';
  static const String logoPath = 'images/logo2.jpg';
  static const String logo3Path = 'images/logo3.jpg';
  static const String logo4Path = 'images/logo4.jpg';
  static const String main = 'images/ChatGPT Image 18 أكتوبر 2025، 12_20_25 م.png';
  //add
  // static const List<String> mainSections = [
  //   'الخدمات',
  //   'العروض',
  //   'المدن',
  //   'الصالونات',
  //   'التعليقات',
  //   'انضم إلينا',
  // ];


}
