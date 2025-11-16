
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/salon_form_controller.dart';


Widget buildAgreementSection(BuildContext context) {
    final SalonFormController controller = Get.put(SalonFormController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: controller.isAgreed.value,
                  onChanged: controller.toggleAgreement,
                  activeColor: AppConstants.primaryColor,
                ),
                const SizedBox(width: 5),
                const Text(
                  AppConstants.agreementText,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            )),
        const SizedBox(height: 12),
        Obx(() => ElevatedButton(
              onPressed: controller.isAgreed.value ? () => controller.submitForm(context) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
             AppConstants.submitButtonText,
                style: TextStyle(color: AppConstants.backgroundColor, fontSize: 16),
              ),
            )),
        const SizedBox(height: 12),
        const Text(
          AppConstants.contactSoonText,
          style: TextStyle(fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 40),
      ],
    );
  }