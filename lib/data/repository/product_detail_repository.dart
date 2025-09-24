import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';
import '../model/product_detail_model.dart';

class DetailRepository {
  final ApiClient _apiClient;

  DetailRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<DetailModel>> getDetail(int id) async {
    final result = await _apiClient.get('/products/detail/$id');

    return result.fold(
          (e) => Result.error(e),
          (data) => Result.ok(DetailModel.fromJson(data)),
    );
  }
}
