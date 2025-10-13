import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
abstract  class AuthState with _$AuthState {
  const factory AuthState({
    bool? isLoginLoading,
    String? loginError,
    bool? loginSuccess,
    bool? isSignupLoading,
    String? signupError,
    bool? signupSuccess,
    bool? isLoadingForgotEmail,
    bool? isLoadingVerifyCode,
    bool? isLoadingResetPassword,
    String? errorForgotEmail,
    String? errorVerifyCode,
    String? errorResetPassword,
    String? forgotEmail,
    String? forgotCode,
    UserModel? user,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
    isLoginLoading: false,
    loginError: null,
    loginSuccess: false,

    isSignupLoading: false,
    signupError: null,
    signupSuccess: false,

    isLoadingForgotEmail: false,
    isLoadingVerifyCode: false,
    isLoadingResetPassword: false,
    errorForgotEmail: null,
    errorVerifyCode: null,
    errorResetPassword: null,
    forgotEmail: null,
    forgotCode: null,

    user: null,
  );
}
