class DetailModel {
  final int id;
  final String title;
  final String description;
  final num price;
  final bool isLiked;
  final num reviewsCount;
  final num rating;
  final List<ProductImage> productImages;
  final List<ProductSize> productSizes;

  DetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.isLiked,
    required this.reviewsCount,
    required this.rating,
    required this.productImages,
    required this.productSizes,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      isLiked: json['isLiked'] ?? false,
      reviewsCount: json['reviewsCount'] ?? 0,
      rating: json['rating'] ?? 0,
      productImages: (json['productImages'] as List<dynamic>? ?? [])
          .map((e) => ProductImage.fromJson(e))
          .toList(),
      productSizes: (json['productSizes'] as List<dynamic>? ?? [])
          .map((e) => ProductSize.fromJson(e))
          .toList(),
    );
  }
}

class ProductImage {
  final int id;
  final String image;

  ProductImage({
    required this.id,
    required this.image,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'] ,
      image: json['image'] ,
    );
  }
}

class ProductSize {
  final int id;
  final String title;

  ProductSize({
    required this.id,
    required this.title,
  });

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(
      id: json['id'] ,
      title: json['title'] ,
    );
  }
}
