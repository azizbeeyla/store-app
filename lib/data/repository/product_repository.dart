import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';
import 'package:store_app/data/model/product_model.dart';

class ProductRepository {
  final ApiClient _apiClient;

  ProductRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<ProductModel>>> getProductsByCategory(int categoryId) async {
    final result = await _apiClient.get("/products/list?CategoryId=$categoryId");

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is List) {
          final products = data
              .map((json) => ProductModel.fromJson(json))
              .toList();
          return Result.ok(products);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }
}
