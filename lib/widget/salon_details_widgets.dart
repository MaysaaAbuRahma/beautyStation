import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/salon_details_controller.dart';
import 'package:omkcpa/models/service_model.dart';
import 'package:omkcpa/screen/service_details.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final Widget child;
  const InfoCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppConstants.backgroundColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppConstants.greyColor.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16,color: Color(0xFF6B4B92),))),
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
        InfoCard(
  title: AppConstants.location,
  child: SizedBox(
    height: 180,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(31.9522, 35.2332),
          zoom: 14,
        ),
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapToolbarEnabled: false,
      ),
    ),
  ),
),

        InfoCard(
          title: AppConstants.workingHours,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(AppConstants.sunThuHours),
              Text(AppConstants.friHours),
              Text(AppConstants.satHours),
            ],
          ),
        ),

       InfoCard(
          title: AppConstants.contact,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              ContactRow(label: 'جوال: 0501234567'),
              ContactRow(label: 'واتساب: 0501234567'),
              ContactRow(label: 'تليجرام: @beautysalon'),
            ],
          ),
        ),

        InfoCard(
          title: AppConstants.similarCenters,
          child: SimilarCenters(),
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  final Color purple;
  const HeaderSection({required this.purple});

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
          const Text('Splash Beauty Salon', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700)),
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
              OutlineButton(label: AppConstants.share),
              const SizedBox(width: 12),
              FilledOutlineButton(label:AppConstants.addToFavorites, purple: Colors.white24),
            ],
          ),
        ],
      ),
    );
  }
}
class TabsRow extends StatelessWidget {
  final Color purple;
  const TabsRow({required this.purple, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SalonDetailsController>();
    final tabs = ['الخدمات', 'نبذة', 'الفريق', 'التقييمات', 'الموقع'];

    return SizedBox(
      height: 50,
      child: Obx(() {
        final activeIndex = controller.activeTabIndex.value;
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: tabs.length,
          itemBuilder: (context, index) {
            final isActive = index == activeIndex;
            return GestureDetector(
              onTap: () => controller.changeTab(index),
              child: TabChip(label: tabs[index], active: isActive, purple: purple),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 5),
        );
      }),
    );
  }
}
class Pill extends StatelessWidget {
  final String text;
  const Pill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String label;
  const OutlineButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}

class FilledOutlineButton extends StatelessWidget {
  final String label;
  final Color purple;
  const FilledOutlineButton({required this.label, required this.purple});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextButton(
          onPressed: () {},
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
class TabChip extends StatelessWidget {
  final String label;
  final bool active;
  final Color purple;
  const TabChip({required this.label, required this.active, required this.purple});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: active ? purple : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: active ? null : Border.all(color: Colors.grey.shade200),
      ),
      child: Text(label, style: TextStyle(color: active ? Colors.white : Colors.black87)),
    );
  }
}
class ContentCard extends StatelessWidget {
  final Widget child;
  const ContentCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}
class Gallery extends StatelessWidget {
  const Gallery();

  @override
  Widget build(BuildContext context) {
    final list = List.filled(6, AppConstants.logo4Path);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            "images/splash.jpg",
          //AppConstants.main,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: list
                .map(
                  (e) => Container(
                    width: (MediaQuery.of(context).size.width - 64) / 4,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(e),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class ServicesList extends StatelessWidget {
  const ServicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SalonDetailsController>();

    return Obx(() {
      final services = controller.services;

      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20),
          color:  AppConstants.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                AppConstants.servicesList,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color:  AppConstants.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (services.isEmpty)
              const Center(
                child: Text(
                AppConstants.noServices,
                  style: TextStyle(color:  AppConstants.greyColor),
                ),
              )
            else
              ...services.map(
                (s) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ServiceCard(service: s),
                ),
              ),
          ],
        ),
      );
    });
  }
}


class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  const ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        color:  AppConstants.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text(
                    '${service.duration} • ${service.desc}',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ServiceDetailsScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  AppConstants.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  ),
                  child: const Text(
                    AppConstants.serviceButton,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutAndReviews extends StatelessWidget {
  const AboutAndReviews();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(20),
        color:  AppConstants.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
             AppConstants.aboutTitle,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppConstants.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'صالون لمسة جمال يقدم تجربة متكاملة للعناية بالشعر والبشرة مع فريق محترف ومنتجات عالية الجودة. نسعى لتقديم خدمة راقية بأسعار عادلة مع أجواء مريحة وخصوصية تامة.',
            style: TextStyle(height: 1.4),
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppConstants.reviews,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          const SizedBox(height: 12),
         RatingBar(),
          const Divider(height: 28),

          Center(
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
               AppConstants.sendReview,
                style: TextStyle(color: AppConstants.backgroundColor, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class RatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: 0.9,
            backgroundColor: Colors.grey.shade300,
            color: AppConstants.primaryColor,
            minHeight: 8,
          ),
        ),
        const SizedBox(width: 12),
        const Text('4.9', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
      ],
    );
  }
}

class ContactRow extends StatelessWidget {
  final String label;
  const ContactRow({ required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(label, style: const TextStyle(fontSize: 15)),
    );
  }
}

class SimilarCenters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SalonDetailsController>();

    return Obx(() {
      final centers = controller.similarCenters;

      return Column(
        children: centers.map((center) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
              color: AppConstants.backgroundColor,
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  center['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                center['name']!,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Row(
                children: [
                  const Icon(Icons.star, color: AppConstants.amberColor, size: 16),
                  const SizedBox(width: 4),
                  Text(center['rating']!),
                  const SizedBox(width: 8),
                  Text(center['city']!),
                ],
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}

