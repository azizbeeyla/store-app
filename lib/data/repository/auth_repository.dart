import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:store_app/data/model/auth_model/reset_password_email.dart';
import 'package:store_app/data/model/auth_model/reset_password_reset.dart';
import 'package:store_app/data/model/auth_model/reset_password_verify.dart';
import '../../core/client/dio_client.dart';
import '../../core/client/result.dart';
import '../model/auth_model/login_model.dart';
import '../model/auth_model/register_model.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthRepository({required ApiClient apiClient}) : _apiClient = apiClient;

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

  Future<Result<String>> forgotPasswordEmail({
    required ResetPasswordEmailModel data,
  }) async {
    final response = await _apiClient.post(
      "/auth/reset-password/email",
      data: data.toJson(),
    );

    return response.fold(
          (error) => Result.error(error),
          (success) => Result.ok(success),
    );
  }

  Future<Result<bool>> forgotPasswordVerify({
    required ResetPasswordVerifyModel data,
  }) async {
    final response = await _apiClient.post(
      "/auth/reset-password/verify",
      data: data.toJson(),
    );

    return response.fold(
          (error) => Result.error(error),
          (success) => Result.ok(true),
    );
  }

  Future<Result<Map<String, dynamic>>> forgotPasswordReset({
    required ResetPasswordResetModel data,
  }) async {
    final response = await _apiClient.post(
      "/auth/reset-password/reset",
      data: data.toJson(),
    );

    return response.fold(
          (error) => Result.error(error),
          (success) => Result.ok(success),
    );
  }
}
