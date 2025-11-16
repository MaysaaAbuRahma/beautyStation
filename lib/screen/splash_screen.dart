import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/controller/splash_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final splashController = Get.put(SplashController());

  @override
  @override
void initState() {
  super.initState();

  _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat();

  requestLocationPermission();
}
Future<void> requestLocationPermission() async {
  var status = await Permission.location.status;

  if (status.isDenied) {
    await Permission.location.request();
  }

  if (status.isPermanentlyDenied) {
    openAppSettings();
  }

  splashController.goToNextScreen();
}


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppConstants.lightPurple
      ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),

            RotationTransition(
              turns: _controller,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppConstants.primaryColor.withOpacity(0.15),
                      blurRadius: 10,
                      spreadRadius: 0.5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(18),
                child: ClipOval(
                  child: Image.asset(
                    AppConstants.logo,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),

            Text(
             AppConstants.appName,
              style: TextStyle(
                fontSize: 32,
                color: AppConstants.primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
                fontFamily: 'DancingScript',
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 20),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppConstants.primaryColor.withOpacity(0.8)),
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
