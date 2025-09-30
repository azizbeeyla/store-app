import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';
import 'package:store_app/data/model/cart_model.dart';

class CartRepository {
  final ApiClient _apiClient;

  CartRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<String>> addToCart({
    required int productId,
    required int sizeId,
  }) async {
    final response = await _apiClient.post(
      "/my-cart/add-item",
      data: {
        "productId": productId,
        "sizeId": sizeId,
      },
    );

    return response.fold(
          (error) => Result.error(error),
          (data) {
        return Result.ok(data);
      },
    );
  }

  Future<Result<CartModel>> getCartList() async {
    final response = await _apiClient.get('/my-cart/my-cart-items');

    return response.fold(
          (error) {
        return Result.error(error);
      },
          (data) {
        if (data is Map<String, dynamic>) {
          final cart = CartModel.fromJson(data);
          return Result.ok(cart);
        }
        return Result.error(Exception("Xato format: CartModel kutilgan"));
      },
    );
  }

  Future<Result<String>> removeFromCart({
    required int id,
  }) async {
    final response = await _apiClient.delete("/my-cart/delete/$id");

    return response.fold(
          (error) => Result.error(error),
          (data) {
        return Result.ok(data);
      },
    );
  }
}
