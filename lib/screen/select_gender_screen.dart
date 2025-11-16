import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/gender_controller.dart';
import 'package:omkcpa/screen/beauty_home_screen.dart';

class SelectGenderScreen extends StatelessWidget {
  SelectGenderScreen({super.key});

  final GenderController controller = Get.put(GenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE9D7F5),
              Color(0xFFFCE4EC),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              AppConstants.ChooseYourCategoty,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryColor,
                ),
              ),
              const SizedBox(height: 40),

              Obx(() => buildCategoryOption(
                    icon: Icons.man,
                    label:AppConstants.male,
                    color: Colors.blueAccent,
                    isSelected: controller.selectedCategory.value == 'رجال',
                    onTap: () => controller.selectCategory('رجال'),
                  )),
              const SizedBox(height: 25),

              Obx(() => buildCategoryOption(
                    icon: Icons.woman,
                    label: AppConstants.female,
                    color: AppConstants.pinkAccent,
                    isSelected: controller.selectedCategory.value == 'نساء',
                    onTap: () => controller.selectCategory('نساء'),
                  )),

              const SizedBox(height: 50),

              Obx(() => AnimatedOpacity(
                    opacity: controller.hasSelection ? 1 : 0.3,
                    duration: const Duration(milliseconds: 300),
                    child: ElevatedButton(
                      onPressed: controller.hasSelection
                          ? () {
                              Get.off(() =>  BeautyHomePage());
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 6,
                        shadowColor: AppConstants.primaryColor.withOpacity(0.4),
                      ),
                      child: const Text(
                      AppConstants.getStarted,
                        style: TextStyle(fontSize: 18, color: AppConstants.backgroundColor),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryOption({
    required IconData icon,
    required String label,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 220,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.12) : AppConstants.backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.8,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: color.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? color : AppConstants.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
