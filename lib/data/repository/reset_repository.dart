import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/data/model/auth_model/reset_password_reset.dart';

import '../../core/client/result.dart';
import '../model/auth_model/reset_password_email.dart';
import '../model/auth_model/reset_password_verify.dart';

class ResetRepository {
  final ApiClient _apiClient;

  ResetRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<String>> resetEmail({
    required ResetPasswordEmailModel data,
  }) async {
    var response = await _apiClient.post(
      "/auth/reset/password/email",
      data: data.toJson(),
    );
    return response.fold((e) => Result.error(e), (data) => Result.ok(data));
  }

  Future<Result<bool>> resetCode({
    required ResetPasswordVerifyModel data,
  }) async {
    var response = await _apiClient.post(
      "/auth/reset/password/verify",
      data: data.toJson(),
    );
    return response.fold((e) => Result.error(e), (data) => Result.ok(data));
  }

  Future<Result<Map<String, dynamic>>> resetPassword({
    required ResetPasswordResetModel data,
  }) async {
    var response = await _apiClient.post(
      "/auth/reset/password/reset",
      data: data.toJson(),
    );
    return response.fold((e) => Result.error(e), (data) => Result.ok(data));
  }
}
