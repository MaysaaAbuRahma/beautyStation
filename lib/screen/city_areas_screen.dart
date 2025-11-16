
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/city_areas_controller.dart';
import 'package:omkcpa/widget/home.dart';

class CityAreasScreen extends StatelessWidget {
  final String cityName;
  const CityAreasScreen({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CityAreasController());
    controller.initCity(cityName);


    return Scaffold(
       endDrawer: buildDrawer(),
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Obx(() {
          final cities = controller.cityAreas.keys.toList();
          final filteredAreas = controller.filteredAreas;
          final initialPosition = controller.cityPosition;

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'الأحياء التي تم العثور عليها في ${controller.selectedCity.value}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B4B92),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      ...cities.map((city) {
                        final isSelected =
                            city == controller.selectedCity.value;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: () => controller.selectCity(city),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppConstants.primaryColor
                                    : AppConstants.lightPurple,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                city,
                                style: TextStyle(
                                  color: isSelected
                                      ? AppConstants.backgroundColor
                                      : AppConstants.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppConstants.lightPurple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                           AppConstants.otherCities,
                            style: TextStyle(color: AppConstants.primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                Container(
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color(0xFFD8C9E8)),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: AppConstants.neighborhoodSearchHint,
                      hintStyle:
                          TextStyle(color: AppConstants.hintTextColor, fontSize: 13),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search, color: AppConstants.primaryColor),
                    ),
                    textAlign: TextAlign.right,
                    onChanged: controller.updateSearch,
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  '${filteredAreas.length} حي',
                  style: const TextStyle(color: Color(0xFF9A89B5), fontSize: 14),
                ),

                const SizedBox(height: 25),

                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: filteredAreas.map((area) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppConstants.lightPurple,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        area,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppConstants.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 20),

                const Text(
                AppConstants.mapTitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GoogleMap(
                      onMapCreated: controller.setMapController,
                      initialCameraPosition: CameraPosition(
                        target: initialPosition,
                        zoom: 12,
                      ),
                      markers: {
                        Marker(
                          markerId:
                              MarkerId(controller.selectedCity.value),
                          position: initialPosition,
                          infoWindow:
                              InfoWindow(title: controller.selectedCity.value),
                        ),
                      },
                      zoomControlsEnabled: true,
                      myLocationButtonEnabled: false,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        }),
      ),
    );
  }
}
