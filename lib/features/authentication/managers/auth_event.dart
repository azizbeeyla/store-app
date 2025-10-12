import 'package:store_app/data/model/auth_model/login_model.dart';
import 'package:store_app/data/model/auth_model/register_model.dart';
import 'package:store_app/data/model/auth_model/reset_password_reset.dart';
import 'package:store_app/data/model/auth_model/reset_password_verify.dart';

import '../../../data/model/auth_model/reset_password_email.dart';

sealed class AuthEvent {}

final class LoginRequested extends AuthEvent {
  final LoginModel loginModel;
  LoginRequested(this.loginModel);
}

final class RegisterRequested extends AuthEvent {
  final AuthModel registerModel;
  RegisterRequested(this.registerModel);
}

final class SendForgotEmail extends AuthEvent {
  final ResetPasswordEmailModel model;
  SendForgotEmail(this.model);
}

final class VerifyForgotCode extends AuthEvent {
  final ResetPasswordVerifyModel model;
  VerifyForgotCode(this.model);
}

final class ResetForgotPassword extends AuthEvent {
  final ResetPasswordResetModel model;
  ResetForgotPassword(this.model);
}


