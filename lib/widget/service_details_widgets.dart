
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:omkcpa/controller/booking_controller.dart';
import 'package:omkcpa/controller/tabs_controller.dart';
import 'package:omkcpa/screen/booking_confirmation_screen.dart';
import 'package:omkcpa/widget/salon_details_widgets.dart';



class HeaderSection2 extends StatelessWidget {
  final Color purple;
  const HeaderSection2({required this.purple});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF666666),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.only(top: 18, bottom: 18),
      child: Column(
        children: [
          const SizedBox(height: 6),
          const Text(
            'تنظيف بشرة عميق + ماسك',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: const [
              Pill(text: '4.9 ★ (433)'),
              Pill(text: 'الرياض • حي الياسمين'),
              Pill(text: 'قص شعر'),
              Pill(text: 'تنظيف بشرة'),
              Pill(text: 'مكياج'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlineButton(label: 'مشاركة'),
              const SizedBox(width: 12),
              FilledOutlineButton(
                label: 'أضف للمفضلة ♥',
                purple: Colors.white24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class TabsRow2 extends StatelessWidget {
  final Color purple;
  const TabsRow2({required this.purple, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TabsController>();

    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Obx(() {
            final bool isActive = index == controller.activeIndex.value;
            return GestureDetector(
              onTap: () => controller.activeIndex.value = index,
              child: TabChip(
                label: controller.tabs[index],
                active: isActive,
                purple: purple,
              ),
            );
          });
        },
        separatorBuilder: (_, __) => const SizedBox(width: 5),
        itemCount: controller.tabs.length,
      ),
    );
  }
}


class _InfoCard2 extends StatelessWidget {
  final String title;
  final Widget child;
  const _InfoCard2({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xFF6B4B92),
              ),
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class AdditionalInfoSections extends StatelessWidget {
  const AdditionalInfoSections();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // _InfoCard2(
        //   title: 'الموقع',
        //   child: Container(
        //     height: 180,
        //     decoration: BoxDecoration(
        //       color: Colors.grey.shade300,
        //       borderRadius: BorderRadius.circular(12),
        //       image: const DecorationImage(
        //         image: AssetImage('images/map.png'),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        const BookingSection(),

        _InfoCard2(
          title: 'التواصل',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              ContactRow(label: 'جوال: 0501234567'),
              ContactRow(label: 'واتساب: 0501234567'),
             ContactRow(label: 'تليجرام: @beautysalon'),
            ],
          ),
        ),

        _InfoCard2(title: 'خدمات قد تهمك', child: SimilarCenters()),
      ],
    );
  }
}



// class _Tag extends StatelessWidget {
//   final String text;
//   const _Tag(this.text);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Text(text, style: const TextStyle(fontSize: 13)),
//     );
//   }
// }

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'question': 'هل تناسب البشرة الحساسة؟',
        'answer':
            'نعم، نستخدم منتجات لطيفة ونعدل الخطوات حسب حساسية بشرتك بعد الاستشارة.',
      },
      {
        'question': 'كل كم أحتاج أعيد الجلسة؟',
        'answer': 'عادة كل 4-6 أسابيع للحفاظ على نقاء وترطيب البشرة.',
      },
      {
        'question': 'هل توجد موانع؟',
        'answer':
            'في حال وجود التهابات شديدة أو تقشير كيميائي قوي حديثاً، يُنصح بالتأجيل والاستشارة المختصة.',
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الأسئلة الشائعة',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Color(0xFF6B4B92),
              ),
            ),
          ),
          const SizedBox(height: 14),
          ...faqs.map(
            (item) =>
                _FAQItem(question: item['question']!, answer: item['answer']!),
          ),
        ],
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String question;
  final String answer;
  const _FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: Color(0xFF6B4B92),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            answer,
            style: const TextStyle(color: Colors.black87, height: 1.4),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class BookingSection extends StatelessWidget {
  const BookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingController>(); 

    return _InfoCard2(
      title: 'احجز هذه الخدمة',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 6),

          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Obx(() => DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: controller.selectedService.value,
                      decoration: _inputDecoration('الخدمة'),
                      items: controller.services
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e, overflow: TextOverflow.ellipsis),
                              ))
                          .toList(),
                      onChanged: (v) {
                        if (v != null) controller.changeService(v);
                      },
                    )),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 60)),
                    );
                    if (picked != null) controller.changeDate(picked);
                  },
                  child: Obx(() => InputDecorator(
                        decoration: _inputDecoration('التاريخ'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                controller.selectedDate.value == null
                                    ? 'اختر التاريخ'
                                    : '${controller.selectedDate.value!.year}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.day}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(Icons.calendar_today,
                                size: 18, color: Colors.grey),
                          ],
                        ),
                      )),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) controller.changeTime(picked);
                  },
                  child: Obx(() => InputDecorator(
                        decoration: _inputDecoration('الوقت'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                controller.selectedTime.value == null
                                    ? '--:--'
                                    : controller.selectedTime.value!.format(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(Icons.access_time,
                                size: 18, color: Colors.grey),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'الإجمالي: 180 ر.س',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              // controller.confirmBooking();
              // Get.to(() => BookingConfirmationScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6B4B92),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text(
              'تأكيد الحجز',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black54, fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
    );
  }
}
