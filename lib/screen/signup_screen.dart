


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/signup_controller.dart';
import 'package:omkcpa/widget/sign_in-up.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          AppConstants.createAccountText,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppConstants.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              const Text(
               AppConstants.welcomeTitle,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppConstants.primaryColor,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
               AppConstants.welcomeSubtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              buildTextField(
                controller: controller.nameController,
                label: AppConstants.fullNameLabel,
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),

             buildTextField(
                controller: controller.phoneController,
                label:AppConstants.phoneLabel,
                icon: Icons.phone_android_outlined,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              buildTextField(
                controller: controller.emailController,
                label: AppConstants.emailLabel,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

             buildTextField(
                controller: controller.passController,
                label: AppConstants.passwordLabel,
                icon: Icons.lock_outline,
                obscure: true,
              ),
              const SizedBox(height: 40),

              Obx(() => SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        shadowColor: AppConstants.primaryColor.withOpacity(0.4),
                      ),
                      onPressed:
                          controller.isLoading.value ? null : controller.signup,
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: AppConstants.backgroundColor)
                          : const Text(
                             AppConstants.createAccount,
                              style: TextStyle(
                                fontSize: 18,
                                color: AppConstants.backgroundColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  )),
              const SizedBox(height: 25),

              const Text("أو", style: TextStyle(color: Colors.black54, fontSize: 16)),
              const SizedBox(height: 25),

              TextButton(
                onPressed: controller.goToLogin,
                child: const Text(
                 AppConstants.loginButton,
                  style: TextStyle(
                    color: AppConstants.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  