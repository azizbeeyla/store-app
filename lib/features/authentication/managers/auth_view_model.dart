import 'package:flutter/material.dart';
import 'package:store_app/data/model/auth_model/reset_password_email.dart';
import 'package:store_app/data/model/auth_model/reset_password_verify.dart';
import 'package:store_app/data/model/auth_model/reset_password_reset.dart';
import 'package:store_app/data/repository/reset_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final ResetRepository _resetRepo;

  AuthViewModel({required ResetRepository resetRepo}) : _resetRepo = resetRepo;

  // Loading states
  bool isLoadingEmail = false;
  bool isLoadingVerify = false;
  bool isLoadingReset = false;

  // Error states
  String? emailError;
  String? verifyError;
  String? resetError;

  // Data states
  String? email;
  String? code;

  Future<void> fetchForgotEmail({
    required ResetPasswordEmailModel model,
  }) async {
    isLoadingEmail = true;
    emailError = null;
    notifyListeners();

    final result = await _resetRepo.resetEmail(data: model);

    result.fold(
      (failure) => emailError = failure.toString(),
      (success) => email = model.email,
    );

    isLoadingEmail = false;
    notifyListeners();
  }

  /// STEP 2: Verify code
  Future<void> fetchForgotVerify({
    required ResetPasswordVerifyModel model,
  }) async {
    isLoadingVerify = true;
    verifyError = null;
    notifyListeners();

    final result = await _resetRepo.resetCode(data: model);

    result.fold(
      (failure) => verifyError = failure.toString(),
      (success) => code = model.code,
    );

    isLoadingVerify = false;
    notifyListeners();
  }

  Future<void> fetchForgotReset({
    required ResetPasswordResetModel model,
  }) async {
    isLoadingReset = true;
    resetError = null;
    notifyListeners();

    final result = await _resetRepo.resetPassword(data: model);

    result.fold(
      (failure) => resetError = failure.toString(),
      (success) {
        // reset successful
      },
    );

    isLoadingReset = false;
    notifyListeners();
  }
}
