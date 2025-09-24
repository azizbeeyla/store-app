import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';

class CartRepository {
  final ApiClient _apiClient;

  CartRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<bool>> addToCart({
    required int productId,
    required int sizeId,
  }) async {
    final response = await _apiClient.post(
      "/my-cart/add-item",
      data: {
        "product_id": productId,
        "size_id": sizeId,
      },
    );

    return response.fold(
          (error) => Result.error(error),
          (data) =>  Result.ok(data),
    );
  }
}
