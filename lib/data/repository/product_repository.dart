import '../../core/client/dio_client.dart';
import '../../core/client/result.dart';
import '../model/product_model.dart';

class ProductRepository {
  final ApiClient _apiClient;

  ProductRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<ProductModel>>> getProductsByCategory(
    int categoryId,
  ) async {
    final result = await _apiClient.get(
      "/products/list?CategoryId=$categoryId",
    );

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

  Future<Result<List<ProductModel>>> getAllProducts() async {
    final result = await _apiClient.get("/products/list");

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

  Future<Result> saveProduct(int productId) async {
    return await _apiClient.post(
      "/auth/save/$productId",
      data: {},
    );
  }

  Future<Result> unSaveProduct(int productId) async {
    return await _apiClient.post(
      "/auth/unsave/$productId",
      data: {},
    );
  }
  Future<Result<List<ProductModel>>> getSavedProduct() async {
    final result = await _apiClient.get("/products/saved-products");

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
