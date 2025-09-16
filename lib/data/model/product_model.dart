class ProductModel {
  final int id;
  final int categoryId;
  final String image;
  final String title;
  final num price;
  final bool isLiked;
  final num discount;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.image,
    required this.title,
    required this.price,
    required this.isLiked,
    required this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      categoryId: json['categoryId'],
      image: json['image'],
      title: json['title'],
      price: (json['price']??0 ),
      isLiked: json['isLiked'] ?? false,
      discount: (json['discount']??0 ),
    );
  }
}
