import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';
import 'package:store_app/data/model/user_model.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<UserModel>> getMe() async {
    final response = await _apiClient.get('/auth/me');
    return response.fold(
      (error) => Result.error(error),
      (data) => Result.ok(
        UserModel.fromJson(
          Map<String, dynamic>.from(data),
        ),
      ),
    );
  }

  Future<Result<UserModel>> updateUser(UserModel user) async {
    final response = await _apiClient.patch(
      '/auth/update',
      data: user.toJson(),
    );
    return response.fold(
      (error) => Result.error(error),
      (data) => Result.ok(
        UserModel.fromJson(
          Map<String, dynamic>.from(data),
        ),
      ),
    );
  }
}
