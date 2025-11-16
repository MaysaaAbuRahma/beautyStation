import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/screen/beauty_home_screen.dart';
import 'package:omkcpa/screen/login_screen.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  var isLoading = false.obs;

  void signup() {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        passController.text.isEmpty) {
      Get.snackbar(
        "تنبيه",
        "يرجى تعبئة جميع الحقول",
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;

      Get.off(() =>  BeautyHomePage());

      Get.snackbar(
        "تم إنشاء الحساب",
        "مرحبًا بك في Beauty Station 💜",
        backgroundColor: const Color(0xFF6B4B92),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  void goToLogin() {
    Get.to(() => LoginScreen());
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}
