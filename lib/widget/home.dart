 import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/screen/Salon_details_screen.dart';
import 'package:omkcpa/screen/beauty_home_screen.dart';
import 'package:omkcpa/screen/beauty_more_screen.dart';
import 'package:omkcpa/screen/profile_screen.dart';
import 'package:omkcpa/screen/salon_registration_form.dart';
import 'package:omkcpa/screen/service_details.dart';

   Widget buildOptionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
        color: AppConstants.backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppConstants.primaryColor,
          fontSize: 14,
        ),
      ),
    );
  }
Widget buildSearchButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppConstants.primaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Text(
            'بحث',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const SizedBox(
          width: 180,
          child: TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'اكتب ما تريد البحث عنه...',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}


 Widget buildServiceCard({
  required BuildContext context, 
  required String title,
  required String subtitle,
  required String imagePath,
}) {
  return Container(
    width: 270,
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    decoration: BoxDecoration(
      color: AppConstants.backgroundColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppConstants.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 45,
          backgroundColor: const Color(0xFFF3ECF8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 15),

        GestureDetector(
          onTap: () {
           Get.to(() => BeautyMoreScreen());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            decoration: BoxDecoration(
              color:  AppConstants.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              AppConstants.learnMore,
              style: TextStyle(color: AppConstants.backgroundColor),
            ),
          ),
        ),
      ],
    ),
  );
}
Widget buildOfferCard({
    required String discount,
    required String title,
    required String salon,
    required String location,
    required String oldPrice,
    required String newPrice,
    required String buttonText,
  }) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: AppConstants.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                 AppConstants.logoPath,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color:  AppConstants.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'خصم $discount',
                    style:
                        const TextStyle(color: AppConstants.backgroundColor, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$salon • $location',
                  style:
                      const TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$newPrice ر.س',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppConstants.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$oldPrice ر.س',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppConstants.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        color: AppConstants.backgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildSalonCard({
  required String name,
  required String rating,
  required String reviews,
  required String location,
  required String service,
}) {
  return Container(
    width: 250, 
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppConstants.backgroundColor,
      borderRadius: BorderRadius.circular(16),
    boxShadow: [
  BoxShadow(
    color: Colors.black.withOpacity(0.25),
    blurRadius: 15, 
    spreadRadius: 2, 
    offset: Offset(0, 6),
  ),
],

    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(
              Icons.storefront,
              size: 50,
              color: Colors.grey[600],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppConstants.primaryColor,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.star, color: AppConstants.amberColor, size: 16),
            const SizedBox(width: 4),
            Text(
              rating,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4),
            Text('($reviews)', style: TextStyle(fontSize: 12, color: AppConstants.greyColor)),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.location_on, size: 14, color: AppConstants.greyColor),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                location,
                style: TextStyle(fontSize: 12, color: AppConstants.greyColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          service,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    ),
  );
}

Widget buildJoinUsSection(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
    decoration: BoxDecoration(
      color: AppConstants.backgroundColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, -3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          AppConstants.joinUs,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppConstants.primaryColor,
          ),
        ),
        const SizedBox(height: 40),

        Wrap(
          spacing: 30,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            buildJoinCard(
              context: context, 
              title: AppConstants.RegisterAsAServiceQwner,
              description:
                  'انضم لشبكتنا وقدم خدماتك بطريقة احترافية وسهلة، وصولاً لعملائك بكل يسر وأمان',
              imagePath: AppConstants.logo3Path,
            ),
           
          ],
        ),
      ],
    ),
  );
}
Widget buildJoinCard({
  required BuildContext context, 
  required String title,
  required String description,
  required String imagePath,
}) {
  return Container(
    width: 330,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    decoration: BoxDecoration(
      color: const Color(0xFFF8F5FC),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
  Get.to(() => SalonRegistrationForm());
},

                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppConstants.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      AppConstants.RegisterNow,
                      style: TextStyle(color: AppConstants.backgroundColor, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
 Widget buildTiltedImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          AppConstants.main,
          width: 100,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget buildReviewCard({
    required String rating,
    required String title,
    required String comment,
    required String userName,
    required String userLocation,
    required String userImage, 
  }) {
    return Container(
      width: 250,

      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF6F4FF), 
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              5,
              (index) => Icon(Icons.star, color: AppConstants.amberColor, size: 20),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppConstants.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            comment,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(radius: 12, backgroundImage: AssetImage(userImage)),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userLocation,
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

 Widget drawerItem(IconData icon, String title, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: AppConstants.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            icon,
            color: AppConstants.greyColor,
            size: 30,
          ),
        ],
      ),
    ),
  );
}


Widget buildDrawer() {
  return Drawer(
    backgroundColor: const Color(0xFFF3ECF8),
    child: ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          color: const Color(0xFFF3ECF8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                AppConstants.appName,
                style: TextStyle(
                  color: AppConstants.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppConstants.logo,
                  height: 70,
                  width: 70,
                ),
              ),
            ],
          ),
        ),

        drawerItem(Icons.home_outlined, AppConstants.Home, () {
         Get.to(() => BeautyHomePage());
        }),

        drawerItem(Icons.spa_outlined, AppConstants.Services, () {
         Get.to(() => ServiceDetailsScreen());
        }),

        drawerItem(Icons.store_mall_directory_outlined, AppConstants.Salons, () {
          Get.to(() => SalonDetailsScreen());
        }),

        drawerItem(Icons.info_outline, AppConstants.About, () {
         // Get.to(() => AboutScreen());
        }),

        drawerItem(Icons.call_outlined, AppConstants.Contact, () {
          //Get.to(() => ContactScreen());
        }),

        drawerItem(Icons.account_circle, AppConstants.profileScreen, () {
          Get.to(() => ProfileScreen());
        }),
      ],
    ),
  );
}
