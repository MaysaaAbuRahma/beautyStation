
// class BeautyCenter {
//   final String image;
//   final String title;
//   final String services;
//   final String location;

//   BeautyCenter({
//     required this.image,
//     required this.title,
//     required this.services,
//     required this.location,
//   });

//   factory BeautyCenter.fromJson(Map<String, dynamic> json) {
//     return BeautyCenter(
//       image: json['image'] ?? '',
//       title: json['title'] ?? '',
//       services: json['services'] ?? '',
//       location: json['location'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'image': image,
//       'title': title,
//       'services': services,
//       'location': location,
//     };
//   }
// }
// //==============================================
// class Service {
//   final String title;
//   final String subtitle;
//   final String imagePath;

//   Service({
//     required this.title,
//     required this.subtitle,
//     required this.imagePath,
//   });

//   factory Service.fromJson(Map<String, dynamic> json) {
//     return Service(
//       title: json['title'] ?? '',
//       subtitle: json['subtitle'] ?? '',
//       imagePath: json['image'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'subtitle': subtitle,
//       'image': imagePath,
//     };
//   }
// }
// //=============================================
// class Offer {
//   final String discount;
//   final String title;
//   final String salon;
//   final String location;
//   final String oldPrice;
//   final String newPrice;
//   final String buttonText;

//   Offer({
//     required this.discount,
//     required this.title,
//     required this.salon,
//     required this.location,
//     required this.oldPrice,
//     required this.newPrice,
//     required this.buttonText,
//   });

//   factory Offer.fromJson(Map<String, dynamic> json) {
//     return Offer(
//       discount: json['discount'] ?? '',
//       title: json['title'] ?? '',
//       salon: json['salon'] ?? '',
//       location: json['location'] ?? '',
//       oldPrice: json['oldPrice'] ?? '',
//       newPrice: json['newPrice'] ?? '',
//       buttonText: json['buttonText'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'discount': discount,
//       'title': title,
//       'salon': salon,
//       'location': location,
//       'oldPrice': oldPrice,
//       'newPrice': newPrice,
//       'buttonText': buttonText,
//     };
//   }
// }
// //==============================================
// class Salon {
//   final String name;
//   final String rating;
//   final String reviews;
//   final String location;
//   final String service;

//   Salon({
//     required this.name,
//     required this.rating,
//     required this.reviews,
//     required this.location,
//     required this.service,
//   });

//   factory Salon.fromJson(Map<String, dynamic> json) {
//     return Salon(
//       name: json['name'] ?? '',
//       rating: json['rating'] ?? '0',
//       reviews: json['reviews'] ?? '0',
//       location: json['location'] ?? '',
//       service: json['service'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'rating': rating,
//       'reviews': reviews,
//       'location': location,
//       'service': service,
//     };
//   }
// }
// //==================================================
// class Review {
//   final String rating;
//   final String title;
//   final String comment;
//   final String userName;
//   final String userLocation;
//   final String userImage;

//   Review({
//     required this.rating,
//     required this.title,
//     required this.comment,
//     required this.userName,
//     required this.userLocation,
//     required this.userImage,
//   });

//   factory Review.fromJson(Map<String, dynamic> json) {
//     return Review(
//       rating: json['rating'] ?? '',
//       title: json['title'] ?? '',
//       comment: json['comment'] ?? '',
//       userName: json['userName'] ?? '',
//       userLocation: json['userLocation'] ?? '',
//       userImage: json['userImage'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'rating': rating,
//       'title': title,
//       'comment': comment,
//       'userName': userName,
//       'userLocation': userLocation,
//       'userImage': userImage,
//     };
//   }
// }
// //====================================================
// class City {
//   final String name;

//   City({required this.name});

//   factory City.fromJson(Map<String, dynamic> json) {
//     return City(name: json['name'] ?? '');
//   }

//   Map<String, dynamic> toJson() {
//     return {'name': name};
//   }
// }
