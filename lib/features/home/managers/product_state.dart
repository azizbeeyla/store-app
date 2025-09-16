import 'package:equatable/equatable.dart';
import 'package:store_app/data/model/product_model.dart';

class ProductState extends Equatable {
  final bool isLoading;
  final List<ProductModel> products;
  final String? errorMessage;
  final int? categoryId;

  const ProductState({
     this.isLoading=false,
     this.products=const [],
     this.errorMessage,
     this.categoryId,
  });


  ProductState copyWith({
    bool? isLoading,
    List<ProductModel>? products,
    String? errorMessage,
    int? categoryId,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, products, categoryId];
}
