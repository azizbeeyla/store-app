import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo;

  AuthBloc({required AuthRepository authRepo})
      : _authRepo = authRepo,
        super(AuthState.initial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<SendForgotEmail>(_onSendForgotEmail);
    on<VerifyForgotCode>(_onVerifyForgotCode);
    on<ResetForgotPassword>(_onResetForgotPassword);
  }
  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      isLoginLoading: true,
      loginError: null,
      loginSuccess: false,
    ));
    final result = await _authRepo.login(event.loginModel);
    result.fold(
          (err) => emit(state.copyWith(
        isLoginLoading: false,
        loginError: err.toString(),
        loginSuccess: false,
      )),
          (data) => emit(state.copyWith(
        isLoginLoading: false,
        loginSuccess: true,
      )),
    );
  }
  Future<void> _onRegisterRequested(
      RegisterRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      isSignupLoading: true,
      signupError: null,
      signupSuccess: false,
    ));
    final result = await _authRepo.register(event.registerModel);
    result.fold(
          (err) => emit(state.copyWith(
        isSignupLoading: false,
        signupError: err.toString(),
        signupSuccess: false,
      )),
          (data) => emit(state.copyWith(
        isSignupLoading: false,
        signupSuccess: true,
      )),
    );
  }
  Future<void> _onSendForgotEmail(
      SendForgotEmail event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      isLoadingForgotEmail: true,
      errorForgotEmail: null,
    ));
    final result = await _authRepo.forgotPasswordEmail(data: event.model);
    result.fold(
          (err) => emit(state.copyWith(
        isLoadingForgotEmail: false,
        errorForgotEmail: err.toString(),
      )),
          (data) => emit(state.copyWith(
        isLoadingForgotEmail: false,
        forgotEmail: event.model.email,
      )),
    );
  }

  Future<void> _onVerifyForgotCode(
      VerifyForgotCode event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      isLoadingVerifyCode: true,
      errorVerifyCode: null,
    ));
    final result = await _authRepo.forgotPasswordVerify(data: event.model);
    result.fold(
          (err) => emit(state.copyWith(
        isLoadingVerifyCode: false,
        errorVerifyCode: err.toString(),
      )),
          (success) => emit(state.copyWith(
        isLoadingVerifyCode: false,
        forgotCode: event.model.code,
      )),
    );
  }
  Future<void> _onResetForgotPassword(
      ResetForgotPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      isLoadingResetPassword: true,
      errorResetPassword: null,
    ));
    final result = await _authRepo.forgotPasswordReset(data: event.model);
    result.fold(
          (err) => emit(state.copyWith(
        isLoadingResetPassword: false,
        errorResetPassword: err.toString(),
      )),
          (data) => emit(state.copyWith(
        isLoadingResetPassword: false,
      )),
    );
  }
}
