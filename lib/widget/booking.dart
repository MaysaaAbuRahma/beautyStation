import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/booking_confirmation_controller.dart';
import 'package:omkcpa/models/booking_model.dart';

Widget statusChip(String label, Color bg, Color textColor) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    ),
  );
}

Widget actionButton(String label, Color bg, Color textColor,
    {BorderSide? border}) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        border: border != null ? Border.fromBorderSide(border) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    ),
  );
}



class BookingCard extends StatelessWidget {
  final BookingModel booking;
  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingConfirmationController>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ر.س ${booking.price}',
                  style: const TextStyle(
                      color: AppConstants.primaryColor, fontWeight: FontWeight.bold, fontSize: 16)),
              Text(booking.title,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.location_on_outlined, color: AppConstants.primaryColor, size: 16),
              const SizedBox(width: 4),
              Text(booking.location,
                  style: const TextStyle(color: Colors.black54, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.star, color: AppConstants.amberColor, size: 16),
              Text(' ${booking.rating}',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(booking.service,
                  style: const TextStyle(color: Colors.black87, fontSize: 14)),
              const SizedBox(width: 6),
              const Icon(Icons.edit, color: AppConstants.primaryColor, size: 18),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${booking.date}  •  ${booking.time}',
                  style: const TextStyle(color: Colors.black54, fontSize: 13)),
              const SizedBox(width: 6),
              const Icon(Icons.access_time, color: AppConstants.primaryColor, size: 18),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (booking.isConfirmed)
                statusChip(AppConstants.statusConfirmed, const Color(0xFFE7FFF3), Colors.teal),
              const SizedBox(width: 8),
              statusChip(
                booking.status,
                booking.status == AppConstants.statusPaid
                    ? const Color(0xFFE7FFF3)
                    : const Color(0xFFFFF4E5),
                booking.status == AppConstants.statusPaid ? Colors.teal : AppConstants.amberColor,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => controller.cancelBooking(booking),
                child: actionButton(AppConstants.cancelLabel, Colors.orange.shade50, Colors.orange),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => controller.rescheduleBooking(booking),
                child: actionButton(AppConstants.rescheduleLabel, Colors.purple.shade50, AppConstants.primaryColor),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => controller.viewDetails(booking),
                child: actionButton(AppConstants.details, Colors.white, AppConstants.primaryColor,
                    border: const BorderSide(color: AppConstants.primaryColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
