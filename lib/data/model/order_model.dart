class OrderModel {
  final int id;
  final String title;
  final String image;
  final String size;
  final num price;
  final num? rating;
  final String status;

  OrderModel({
    required this.id,
    required this.title,
    required this.image,
    required this.size,
    required this.price,
    required this.rating,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['image'],
      size: json['size'] ?? '',
      price: json['price'] ?? 0,
      rating: json['rating'],
      status: json['status'],
    );
  }
}
