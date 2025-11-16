
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/beauty_controller.dart';
import 'package:omkcpa/screen/salon_details_screen.dart';
import 'package:omkcpa/widget/home.dart';

class BeautyMoreScreen extends StatelessWidget {
  const BeautyMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BeautyController());

    return Scaffold(
       endDrawer: buildDrawer(),
      backgroundColor: const Color.fromARGB(255, 246, 246, 247),
      appBar: AppBar(
        title: const Text(
         AppConstants.learnMore,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 234, 230, 240),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                         AppConstants.AllBeautyCenters,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                         AppConstants.sectionSubtitle,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppConstants.primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 150),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: const EdgeInsets.only(top: 120),
                    child: Card(
                      color: AppConstants.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(
                          () => Column(
                            children: List.generate(
                              controller.buttonTitles.length,
                              (index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: AppConstants.backgroundColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey.shade300),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              decoration: const InputDecoration(
                                                hintText:AppConstants.searchHint,
                                                border: InputBorder.none,
                                              ),
                                              onChanged: controller.updateSearch,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const Icon(Icons.search, color: AppConstants.greyColor),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () =>
                                            controller.selectButton(index),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              controller.selectedButtonIndex.value ==
                                                      index
                                                  ? AppConstants.primaryColor
                                                  :  AppConstants.lightGreyBackground,
                                          foregroundColor:
                                              controller.selectedButtonIndex.value ==
                                                      index
                                                  ? AppConstants.backgroundColor
                                                  : AppConstants.textColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          elevation: 2,
                                        ),
                                        child: Text(
                                          controller.buttonTitles[index],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() {
                final centers = controller.filteredCenters;
                if (centers.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                     AppConstants.noResultsText
                     ,
                      style: TextStyle(color: AppConstants.greyColor, fontSize: 16),
                    ),
                  );
                }

                return Column(
                  children: centers.map((center) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.vertical(top: Radius.circular(15)),
                            child: Image.asset(
                              center['image'] ?? 'images/default.jpg',
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  center['title'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppConstants.textColor,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  center['services'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  center['location'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppConstants.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          AppConstants.bookNow,
                                          style: TextStyle(
                                            color: AppConstants.backgroundColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Get.to(() =>  SalonDetailsScreen());
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                            color: AppConstants.primaryColor,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          AppConstants.details,
                                          style: TextStyle(
                                            color: AppConstants.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
