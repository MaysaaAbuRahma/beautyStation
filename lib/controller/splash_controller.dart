import 'package:get/get.dart';
import 'package:omkcpa/screen/login_screen.dart';

class SplashController extends GetxController {

  void goToNextScreen() {
    Future.delayed(const Duration(seconds:4), () {
      Get.off(() => LoginScreen());
    });
  }
}
