
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/screen/profile_screen.dart';
import 'package:omkcpa/screen/splash_screen.dart'; 

void main() {
  runApp(const BeautyStationApp());
}

class BeautyStationApp extends StatelessWidget {
  const BeautyStationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title:AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Tajawal',
        primaryColor: AppConstants.primaryColor,
        scaffoldBackgroundColor: AppConstants.backgroundColor,
      ),
      home:  SplashScreen(),
      //home: ProfileScreen(),
    );
  }
}
