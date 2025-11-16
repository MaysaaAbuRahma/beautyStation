import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/screen/booking_confirmation_screen.dart';
import 'package:omkcpa/widget/home.dart';
import 'package:omkcpa/widget/sign_in-up.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         endDrawer: buildDrawer(),
        backgroundColor: const Color(0xFFF8F8F8),
        appBar: AppBar(
          title: const Text(
           AppConstants.profileScreen,
            style: TextStyle(color: AppConstants.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppConstants.primaryColor),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                buildTextField(
                  controller: emailController,
                  label: "البريد الإلكتروني",
                  icon: Icons.email,
                ),
                const SizedBox(height: 15),

                buildTextField(
                  controller: firstNameController,
                  label: "الاسم الأول",
                  icon: Icons.person,
                ),
                const SizedBox(height: 15),

                buildTextField(
                  controller: lastNameController,
                  label: "اسم العائلة",
                  icon: Icons.family_restroom,
                ),
                const SizedBox(height: 15),

                buildTextField(
                  controller: phoneController,
                  label: "رقم الهاتف",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 15),

                buildTextField(
                  controller: addressController,
                  label: "العنوان",
                  icon: Icons.home,
                ),

                const SizedBox(height: 35),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                           Get.to(() => const BookingConfirmationScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6B4B92),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const Icon(Icons.calendar_month, color: Colors.white),
                        label: const Text(
                          'مواعيدي',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const Icon(Icons.favorite, color: Colors.white),
                        label: const Text(
                          'المفضلة',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final updatedData = {
                        "email": emailController.text,
                        "firstName": firstNameController.text,
                        "lastName": lastNameController.text,
                        "phone": phoneController.text,
                        "address": addressController.text,
                      };

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("تم تحديث الملف الشخصي بنجاح"),
                          backgroundColor: AppConstants.primaryColor,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "تحديث الملف الشخصي",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      );
    
  }

  
}
