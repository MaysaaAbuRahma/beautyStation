
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/booking_confirmation_controller.dart';
import 'package:omkcpa/widget/booking.dart';
import 'package:omkcpa/widget/home.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingConfirmationController());
    

    return Scaffold(
       endDrawer: buildDrawer(),
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: AppConstants.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          AppConstants.myBookingsTitle,
          style: TextStyle(
            color: AppConstants.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppConstants.primaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          final bookings = controller.filteredBookings;

          return ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppConstants.backgroundColor,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.sortOrder.value,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: const [
                          DropdownMenuItem(
                            value: 'الأبعد أولاً',
                            child: Text(AppConstants.sortByFurthest),
                          ),
                          DropdownMenuItem(
                            value: 'الأقرب أولاً',
                            child: Text(AppConstants.sortByNearest),
                          ),
                        ],
                        onChanged: (v) {
                          if (v != null) controller.changeSort(v);
                        },
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 0,
                    child: Container(
                      width: 230,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppConstants.backgroundColor,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: AppConstants.SearchBySalonOrServiceName,
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                        ),
                        onChanged: controller.updateSearch,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              if (bookings.isEmpty)
                const Center(
                  child: Text(
                   AppConstants.noBookingsFound,
                    style: TextStyle(color: Colors.black45),
                  ),
                )
              else
                ...bookings.map((b) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: BookingCard(booking: b),
                    )),
            ],
          );
        }),
      ),
    );
  }
}
