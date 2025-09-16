import 'package:flutter/material.dart';
import '../../../data/model/auth_model/login_model.dart';
import '../../../data/repository/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepo;

  bool isLoading = false;
  String? error;
  bool success = false;

  LoginViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;

  Future<void> login(LoginModel model) async {
    isLoading = true;
    error = null;
    success = false;
    notifyListeners();

    final result = await _authRepo.login(model);

    result.fold(
          (err) {
        error = err.toString();
      },
          (data) {
        success = true;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
