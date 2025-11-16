
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class SalonFormController extends GetxController {
  var centerName = ''.obs;
  var commercialReg = ''.obs;
  var businessType = RxnString();
  var description = ''.obs;

  var phone = ''.obs;
  var whatsapp = ''.obs;
  var email = ''.obs;
  var website = ''.obs;

  var city = RxnString();
  var area = ''.obs;
  var address = ''.obs;
  var googleMapLink = ''.obs;

  var commercialFile = RxnString();
  var taxFile = RxnString();
  var nationalAddressFile = RxnString();
  var vatFile = RxnString();

  RxBool isAgreed = false.obs;

  void toggleAgreement(bool? value) => isAgreed.value = value ?? false;

  Future<void> pickFile(RxnString file) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) file.value = result.files.single.name;
  }

  void submitForm(BuildContext context) {
    if (!isAgreed.value) {
      Get.snackbar(
        "تنبيه",
        "يجب الموافقة على الشروط أولاً",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    Get.snackbar(
      "تم الإرسال",
      "تم إرسال الطلب بنجاح، سنعاود الاتصال بك قريبًا",
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
