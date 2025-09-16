import 'package:flutter/material.dart';
import '../../../data/model/auth_model/register_model.dart';
import '../../../data/repository/auth_repository.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthRepository _registerRepo;

  bool isLoading = false;
  String? error;
  bool success = false;

  RegisterViewModel({required AuthRepository registerRepo})
      : _registerRepo = registerRepo;

  Future<void> register(AuthModel model) async {
    isLoading = true;
    error = null;
    success = false;
    notifyListeners();

    final result = await _registerRepo.register(model);

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
