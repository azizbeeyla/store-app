import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/client/dio_client.dart';
import '../../core/client/result.dart';
import '../model/auth_model/register_model.dart';
import '../model/auth_model/login_model.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// Register 
  Future<Result<Map<String, dynamic>>> register(AuthModel model) async {
    final result = await _apiClient.post(
      "/auth/register",
      data: model.toJson(),
    );

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is Map<String, dynamic>) {
          final token = data['accessToken'];
          if (token != null) {
            _secureStorage.write(key: "token", value: token);
          }
          return Result.ok(data);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }

  /// Login
  Future<Result<Map<String, dynamic>>> login(LoginModel model) async {
    final result = await _apiClient.post(
      "/auth/login",
      data: model.toJson(),
    );

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is Map<String, dynamic>) {
          final token = data['accessToken'];
          if (token != null) {
            _secureStorage.write(key: "token", value: token);
          }
          return Result.ok(data);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }
}
