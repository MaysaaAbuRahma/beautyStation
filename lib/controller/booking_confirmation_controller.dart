import 'package:get/get.dart';
import 'package:omkcpa/models/booking_model.dart';

class BookingConfirmationController extends GetxController {
  var bookings = <BookingModel>[].obs;

  var searchQuery = ''.obs;
  var sortOrder = 'الأبعد أولاً'.obs;

  @override
  void onInit() {
    super.onInit();
    loadBookings();
  }

  void loadBookings() {
    bookings.value = [
      BookingModel(
        title: 'DG Beauty',
        location: 'جدة - السلامة',
        rating: 5.0,
        service: 'قص + تسريحة',
        price: 199,
        stylist: 'نورة',
        date: '08/09/2025',
        time: '16:30',
        status: 'مدفوع',
        isConfirmed: true,
      ),
      BookingModel(
        title: 'Splash Beauty Salon',
        location: 'الرياض - حي الياسمين',
        rating: 4.9,
        service: 'تنظيف بشرة عميق + ماسك',
        price: 180,
        stylist: 'ريم',
        date: '05/09/2025',
        time: '18:00',
        status: 'الدفع عند الوصول',
        isConfirmed: true,
      ),
      BookingModel(
        title: 'صالون أناقة',
        location: 'الدمام - المركز التجاري',
        rating: 4.8,
        service: 'صبغ + قص',
        price: 220,
        stylist: 'سارة',
        date: '10/09/2025',
        time: '14:00',
        status: 'مدفوع',
        isConfirmed: false,
      ),
    ];
  }

  List<BookingModel> get filteredBookings {
    var filtered = bookings.where((b) {
      final q = searchQuery.value;
      return b.title.contains(q) ||
          b.location.contains(q) ||
          b.service.contains(q);
    }).toList();

    if (sortOrder.value == 'الأقرب أولاً') {
      filtered.sort((a, b) => a.date.compareTo(b.date));
    } else {
      filtered.sort((a, b) => b.date.compareTo(a.date));
    }

    return filtered;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  void changeSort(String value) {
    sortOrder.value = value;
  }
  void cancelBooking(BookingModel booking) {
    bookings.remove(booking);
    Get.snackbar('تم الإلغاء', 'تم إلغاء الحجز بنجاح');
  }

  void rescheduleBooking(BookingModel booking) {
    Get.snackbar('إعادة الجدولة', 'يمكنك تحديد موعد جديد لهذا الحجز');
  }

  void viewDetails(BookingModel booking) {
    Get.toNamed('/bookingDetails', arguments: booking);
  }
}
