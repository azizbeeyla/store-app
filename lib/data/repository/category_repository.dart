import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';
import 'package:store_app/data/model/category_model.dart';

class CategoryRepository {
  final ApiClient _apiClient;

  CategoryRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<CategoryModel>>> getCategories() async {
    final result = await _apiClient.get("/categories/list");

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is List) {
          final categories = data
              .map((json) => CategoryModel.fromJson(json))
              .toList()
              .cast<CategoryModel>();
          return Result.ok(categories);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }
}
