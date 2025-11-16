import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'dart:math' as math;
import 'package:omkcpa/screen/city_areas_screen.dart';
import 'package:omkcpa/widget/home.dart';
import '../controller/beauty_home_controller.dart';

class BeautyHomePage extends StatelessWidget {
  final BeautyHomeController controller = Get.put(BeautyHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: buildDrawer(),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
                children: [
                
                    Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu,size: 38,      
      color: AppConstants.primaryColor,),
        onPressed: () {
          Scaffold.of(context).openEndDrawer(); 
        },
      ),
    ),
  
                  const SizedBox(width: 28),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                           AppConstants.appName,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 34,
                              color: AppConstants.primaryColor,
                              height: 1.1,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 10),
                          Text(
                           AppConstants.description,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppConstants.textColor,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),

                    Flexible(
                      child: Transform.rotate(
                        angle: -8 * math.pi / 180,
                        child: buildTiltedImage(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Transform.rotate(
                        angle: 8 * math.pi / 180,
                        child: buildTiltedImage(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: AppConstants.secondaryColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      Icon(Icons.language, color: AppConstants.backgroundColor, size: 28),
                      // SizedBox(width: 10),
                      Expanded(
                        child: Text(
                            AppConstants.websiteBannerText,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppConstants.backgroundColor,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),

              Column(
                children: [
                  const Text(
                    AppConstants.searchHeadline,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: AppConstants.primaryColor,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  Center(
  child: buildSearchButton(),
),
              
                 

                  const SizedBox(height: 50),

                  Obx(
                    () => Text(
                      '${controller.bookedAppointments.value}',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: AppConstants.primaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),
                  const Text(
                   AppConstants.bookedTodayText,
                    style: TextStyle(fontSize: 18, color: AppConstants.primaryColor),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppConstants.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    const Text(
                    AppConstants.servicesTitle,
                      style: TextStyle(
                        color: AppConstants.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Obx(
                      () => Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: controller.services.map((service) {
                          return buildServiceCard(
                            title: service['title'] ?? '',
                            subtitle: service['subtitle'] ?? '',
                            imagePath: service['image'] ?? '',
                            context: context,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                     AppConstants.citiesTitle,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppConstants.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                     AppConstants.citiesSubtitle ,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Obx(
                      () => Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        alignment: WrapAlignment.center,
                        children: controller.cities.map((city) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectCity(city);
                              Get.to(() => CityAreasScreen(cityName: city));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3ECF8),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    city,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppConstants.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: AppConstants.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppConstants.backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        AppConstants.offersTitle,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Obx(
                        () => Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: controller.offers.map((offer) {
                            return buildOfferCard(
                              discount: offer['discount'] ?? '',
                              title: offer['title'] ?? '',
                              salon: offer['salon'] ?? '',
                              location: offer['location'] ?? '',
                              oldPrice: offer['oldPrice'] ?? '',
                              newPrice: offer['newPrice'] ?? '',
                              buttonText: offer['buttonText'] ?? '',
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  Text(
                   AppConstants.popularSalonsTitle,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: controller.salons.map((salon) {
                        return buildSalonCard(
                          name: salon['name'] ?? '',
                          rating: salon['rating'] ?? '0',
                          reviews: salon['reviews'] ?? '0',
                          location: salon['location'] ?? '',
                          service: salon['service'] ?? '',
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 40),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppConstants.backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                         AppConstants.reviewsTitle,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: controller.reviews.map((review) {
                              return buildReviewCard(
                                rating: review['rating'] ?? '',
                                title: review['title'] ?? '',
                                comment: review['comment'] ?? '',
                                userName: review['userName'] ?? '',
                                userLocation: review['userLocation'] ?? '',
                                userImage: review['userImage'] ?? '',
                              );
                            }).toList(),
                          ),
                        ),

                        const SizedBox(height: 40),
                        Text(
                           AppConstants.recommendationsTitle,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: controller.recommendedSalons.map((salon) {
                              return buildSalonCard(
                                name: salon['name'] ?? '',
                                rating: salon['rating'] ?? '',
                                reviews: salon['reviews'] ?? '',
                                location: salon['location'] ?? '',
                                service: salon['service'] ?? '',
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                  buildJoinUsSection(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
