import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/salon_details_controller.dart';
import 'package:omkcpa/widget/home.dart';
import 'package:omkcpa/widget/salon_details_widgets.dart';

class SalonDetailsScreen extends StatelessWidget {
  
  final SalonDetailsController controller = Get.put(SalonDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       endDrawer: buildDrawer(),
    appBar: AppBar(
         
          iconTheme: const IconThemeData(color: AppConstants.primaryColor),
        ),

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 90),
            child: Column(
              children: [
                HeaderSection(purple: AppConstants.primaryColor),
                const SizedBox(height: 10),
                TabsRow(purple: AppConstants.primaryColor),
                const SizedBox(height: 16),
                ContentCard(
                  child: Column(
                    children: [Gallery(), const SizedBox(height: 10)],
                  ),
                ),
                const SizedBox(height: 20),
                ServicesList(),
                SizedBox(height: 10),
                AboutAndReviews(),
                const SizedBox(height: 20),

                const AdditionalInfoSections(),
                const SizedBox(height: 20),
              ],
            ),
          ),

          Positioned(
            left: 16,
            right: 16,
            bottom: 18,
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(28),
              color: AppConstants.primaryColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: () {},
                child: SizedBox(
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          AppConstants.chooseService,
                          style: TextStyle(color: AppConstants.backgroundColor, fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Text(
                         AppConstants.readyToBook,
                          style: TextStyle(color: AppConstants.backgroundColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

