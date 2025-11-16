import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  var selectedEmployee = 'ريم'.obs;
  var selectedService = 'تنظيف بشرة عميق + ماسك - 180 ر.س'.obs;
  var selectedDate = Rxn<DateTime>();
  var selectedTime = Rxn<TimeOfDay>();

  final employees = ['ريم', 'هدى', 'سارة'];
  final services = [
    'تنظيف بشرة عميق + ماسك - 180 ر.س',
    'تقشير كيميائي - 220 ر.س',
    'ماسك ترطيب - 120 ر.س',
  ];

  void changeEmployee(String value) => selectedEmployee.value = value;
  void changeService(String value) => selectedService.value = value;
  void changeDate(DateTime date) => selectedDate.value = date;
  void changeTime(TimeOfDay time) => selectedTime.value = time;

  void confirmBooking() {
    if (selectedDate.value == null || selectedTime.value == null) {
      Get.snackbar("تنبيه", "يرجى اختيار التاريخ والوقت",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    Get.snackbar(
      "تم الحجز ",
      "تم تأكيد حجزك بنجاح",
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );

    // Get.to(() => const BookingConfirmationScreen());
  }
}
