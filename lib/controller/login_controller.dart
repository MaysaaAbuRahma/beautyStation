import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/screen/select_gender_screen.dart';
import 'package:omkcpa/screen/signup_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "خطأ",
        "يرجى إدخال البريد الإلكتروني وكلمة المرور",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;

      Get.to(() =>  SelectGenderScreen());

      Get.snackbar(
        "تم تسجيل الدخول",
        "مرحبًا بك مجددًا 💜",
        backgroundColor: const Color(0xFF6B4B92),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  void goToSignup() {
    Get.to(() => const SignupScreen());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
