class BookingModel {
  final String title;
  final String location;
  final double rating;
  final String service;
  final int price;
  final String stylist;
  final String date;
  final String time;
  final String status;
  final bool isConfirmed;

  BookingModel({
    required this.title,
    required this.location,
    required this.rating,
    required this.service,
    required this.price,
    required this.stylist,
    required this.date,
    required this.time,
    required this.status,
    required this.isConfirmed,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      service: json['service'] ?? '',
      price: json['price'] ?? 0,
      stylist: json['stylist'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      status: json['status'] ?? '',
      isConfirmed: json['isConfirmed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'location': location,
      'rating': rating,
      'service': service,
      'price': price,
      'stylist': stylist,
      'date': date,
      'time': time,
      'status': status,
      'isConfirmed': isConfirmed,
    };
  }
}
