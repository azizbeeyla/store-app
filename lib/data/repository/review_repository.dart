import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';
import 'package:store_app/data/model/review_model.dart';

class ReviewRepository {
  final ApiClient _apiClient;

  ReviewRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<ReviewModel>>> getReviews({required int id}) async {
    var response = await _apiClient.get<List>("/reviews/list/$id");
    return response.fold(
      (error) => Result.error(error),
      (val) =>
          Result.ok(val.map((item) => ReviewModel.fromJson(item)).toList()),
    );
  }
}
