// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 bool? get isLoginLoading; String? get loginError; bool? get loginSuccess; bool? get isSignupLoading; String? get signupError; bool? get signupSuccess; bool? get isLoadingForgotEmail; bool? get isLoadingVerifyCode; bool? get isLoadingResetPassword; String? get errorForgotEmail; String? get errorVerifyCode; String? get errorResetPassword; String? get forgotEmail; String? get forgotCode; UserModel? get user;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.isLoginLoading, isLoginLoading) || other.isLoginLoading == isLoginLoading)&&(identical(other.loginError, loginError) || other.loginError == loginError)&&(identical(other.loginSuccess, loginSuccess) || other.loginSuccess == loginSuccess)&&(identical(other.isSignupLoading, isSignupLoading) || other.isSignupLoading == isSignupLoading)&&(identical(other.signupError, signupError) || other.signupError == signupError)&&(identical(other.signupSuccess, signupSuccess) || other.signupSuccess == signupSuccess)&&(identical(other.isLoadingForgotEmail, isLoadingForgotEmail) || other.isLoadingForgotEmail == isLoadingForgotEmail)&&(identical(other.isLoadingVerifyCode, isLoadingVerifyCode) || other.isLoadingVerifyCode == isLoadingVerifyCode)&&(identical(other.isLoadingResetPassword, isLoadingResetPassword) || other.isLoadingResetPassword == isLoadingResetPassword)&&(identical(other.errorForgotEmail, errorForgotEmail) || other.errorForgotEmail == errorForgotEmail)&&(identical(other.errorVerifyCode, errorVerifyCode) || other.errorVerifyCode == errorVerifyCode)&&(identical(other.errorResetPassword, errorResetPassword) || other.errorResetPassword == errorResetPassword)&&(identical(other.forgotEmail, forgotEmail) || other.forgotEmail == forgotEmail)&&(identical(other.forgotCode, forgotCode) || other.forgotCode == forgotCode)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,isLoginLoading,loginError,loginSuccess,isSignupLoading,signupError,signupSuccess,isLoadingForgotEmail,isLoadingVerifyCode,isLoadingResetPassword,errorForgotEmail,errorVerifyCode,errorResetPassword,forgotEmail,forgotCode,user);

@override
String toString() {
  return 'AuthState(isLoginLoading: $isLoginLoading, loginError: $loginError, loginSuccess: $loginSuccess, isSignupLoading: $isSignupLoading, signupError: $signupError, signupSuccess: $signupSuccess, isLoadingForgotEmail: $isLoadingForgotEmail, isLoadingVerifyCode: $isLoadingVerifyCode, isLoadingResetPassword: $isLoadingResetPassword, errorForgotEmail: $errorForgotEmail, errorVerifyCode: $errorVerifyCode, errorResetPassword: $errorResetPassword, forgotEmail: $forgotEmail, forgotCode: $forgotCode, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 bool? isLoginLoading, String? loginError, bool? loginSuccess, bool? isSignupLoading, String? signupError, bool? signupSuccess, bool? isLoadingForgotEmail, bool? isLoadingVerifyCode, bool? isLoadingResetPassword, String? errorForgotEmail, String? errorVerifyCode, String? errorResetPassword, String? forgotEmail, String? forgotCode, UserModel? user
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoginLoading = freezed,Object? loginError = freezed,Object? loginSuccess = freezed,Object? isSignupLoading = freezed,Object? signupError = freezed,Object? signupSuccess = freezed,Object? isLoadingForgotEmail = freezed,Object? isLoadingVerifyCode = freezed,Object? isLoadingResetPassword = freezed,Object? errorForgotEmail = freezed,Object? errorVerifyCode = freezed,Object? errorResetPassword = freezed,Object? forgotEmail = freezed,Object? forgotCode = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
isLoginLoading: freezed == isLoginLoading ? _self.isLoginLoading : isLoginLoading // ignore: cast_nullable_to_non_nullable
as bool?,loginError: freezed == loginError ? _self.loginError : loginError // ignore: cast_nullable_to_non_nullable
as String?,loginSuccess: freezed == loginSuccess ? _self.loginSuccess : loginSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isSignupLoading: freezed == isSignupLoading ? _self.isSignupLoading : isSignupLoading // ignore: cast_nullable_to_non_nullable
as bool?,signupError: freezed == signupError ? _self.signupError : signupError // ignore: cast_nullable_to_non_nullable
as String?,signupSuccess: freezed == signupSuccess ? _self.signupSuccess : signupSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isLoadingForgotEmail: freezed == isLoadingForgotEmail ? _self.isLoadingForgotEmail : isLoadingForgotEmail // ignore: cast_nullable_to_non_nullable
as bool?,isLoadingVerifyCode: freezed == isLoadingVerifyCode ? _self.isLoadingVerifyCode : isLoadingVerifyCode // ignore: cast_nullable_to_non_nullable
as bool?,isLoadingResetPassword: freezed == isLoadingResetPassword ? _self.isLoadingResetPassword : isLoadingResetPassword // ignore: cast_nullable_to_non_nullable
as bool?,errorForgotEmail: freezed == errorForgotEmail ? _self.errorForgotEmail : errorForgotEmail // ignore: cast_nullable_to_non_nullable
as String?,errorVerifyCode: freezed == errorVerifyCode ? _self.errorVerifyCode : errorVerifyCode // ignore: cast_nullable_to_non_nullable
as String?,errorResetPassword: freezed == errorResetPassword ? _self.errorResetPassword : errorResetPassword // ignore: cast_nullable_to_non_nullable
as String?,forgotEmail: freezed == forgotEmail ? _self.forgotEmail : forgotEmail // ignore: cast_nullable_to_non_nullable
as String?,forgotCode: freezed == forgotCode ? _self.forgotCode : forgotCode // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? isLoginLoading,  String? loginError,  bool? loginSuccess,  bool? isSignupLoading,  String? signupError,  bool? signupSuccess,  bool? isLoadingForgotEmail,  bool? isLoadingVerifyCode,  bool? isLoadingResetPassword,  String? errorForgotEmail,  String? errorVerifyCode,  String? errorResetPassword,  String? forgotEmail,  String? forgotCode,  UserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.isLoginLoading,_that.loginError,_that.loginSuccess,_that.isSignupLoading,_that.signupError,_that.signupSuccess,_that.isLoadingForgotEmail,_that.isLoadingVerifyCode,_that.isLoadingResetPassword,_that.errorForgotEmail,_that.errorVerifyCode,_that.errorResetPassword,_that.forgotEmail,_that.forgotCode,_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? isLoginLoading,  String? loginError,  bool? loginSuccess,  bool? isSignupLoading,  String? signupError,  bool? signupSuccess,  bool? isLoadingForgotEmail,  bool? isLoadingVerifyCode,  bool? isLoadingResetPassword,  String? errorForgotEmail,  String? errorVerifyCode,  String? errorResetPassword,  String? forgotEmail,  String? forgotCode,  UserModel? user)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.isLoginLoading,_that.loginError,_that.loginSuccess,_that.isSignupLoading,_that.signupError,_that.signupSuccess,_that.isLoadingForgotEmail,_that.isLoadingVerifyCode,_that.isLoadingResetPassword,_that.errorForgotEmail,_that.errorVerifyCode,_that.errorResetPassword,_that.forgotEmail,_that.forgotCode,_that.user);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? isLoginLoading,  String? loginError,  bool? loginSuccess,  bool? isSignupLoading,  String? signupError,  bool? signupSuccess,  bool? isLoadingForgotEmail,  bool? isLoadingVerifyCode,  bool? isLoadingResetPassword,  String? errorForgotEmail,  String? errorVerifyCode,  String? errorResetPassword,  String? forgotEmail,  String? forgotCode,  UserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.isLoginLoading,_that.loginError,_that.loginSuccess,_that.isSignupLoading,_that.signupError,_that.signupSuccess,_that.isLoadingForgotEmail,_that.isLoadingVerifyCode,_that.isLoadingResetPassword,_that.errorForgotEmail,_that.errorVerifyCode,_that.errorResetPassword,_that.forgotEmail,_that.forgotCode,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.isLoginLoading, this.loginError, this.loginSuccess, this.isSignupLoading, this.signupError, this.signupSuccess, this.isLoadingForgotEmail, this.isLoadingVerifyCode, this.isLoadingResetPassword, this.errorForgotEmail, this.errorVerifyCode, this.errorResetPassword, this.forgotEmail, this.forgotCode, this.user});
  

@override final  bool? isLoginLoading;
@override final  String? loginError;
@override final  bool? loginSuccess;
@override final  bool? isSignupLoading;
@override final  String? signupError;
@override final  bool? signupSuccess;
@override final  bool? isLoadingForgotEmail;
@override final  bool? isLoadingVerifyCode;
@override final  bool? isLoadingResetPassword;
@override final  String? errorForgotEmail;
@override final  String? errorVerifyCode;
@override final  String? errorResetPassword;
@override final  String? forgotEmail;
@override final  String? forgotCode;
@override final  UserModel? user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.isLoginLoading, isLoginLoading) || other.isLoginLoading == isLoginLoading)&&(identical(other.loginError, loginError) || other.loginError == loginError)&&(identical(other.loginSuccess, loginSuccess) || other.loginSuccess == loginSuccess)&&(identical(other.isSignupLoading, isSignupLoading) || other.isSignupLoading == isSignupLoading)&&(identical(other.signupError, signupError) || other.signupError == signupError)&&(identical(other.signupSuccess, signupSuccess) || other.signupSuccess == signupSuccess)&&(identical(other.isLoadingForgotEmail, isLoadingForgotEmail) || other.isLoadingForgotEmail == isLoadingForgotEmail)&&(identical(other.isLoadingVerifyCode, isLoadingVerifyCode) || other.isLoadingVerifyCode == isLoadingVerifyCode)&&(identical(other.isLoadingResetPassword, isLoadingResetPassword) || other.isLoadingResetPassword == isLoadingResetPassword)&&(identical(other.errorForgotEmail, errorForgotEmail) || other.errorForgotEmail == errorForgotEmail)&&(identical(other.errorVerifyCode, errorVerifyCode) || other.errorVerifyCode == errorVerifyCode)&&(identical(other.errorResetPassword, errorResetPassword) || other.errorResetPassword == errorResetPassword)&&(identical(other.forgotEmail, forgotEmail) || other.forgotEmail == forgotEmail)&&(identical(other.forgotCode, forgotCode) || other.forgotCode == forgotCode)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,isLoginLoading,loginError,loginSuccess,isSignupLoading,signupError,signupSuccess,isLoadingForgotEmail,isLoadingVerifyCode,isLoadingResetPassword,errorForgotEmail,errorVerifyCode,errorResetPassword,forgotEmail,forgotCode,user);

@override
String toString() {
  return 'AuthState(isLoginLoading: $isLoginLoading, loginError: $loginError, loginSuccess: $loginSuccess, isSignupLoading: $isSignupLoading, signupError: $signupError, signupSuccess: $signupSuccess, isLoadingForgotEmail: $isLoadingForgotEmail, isLoadingVerifyCode: $isLoadingVerifyCode, isLoadingResetPassword: $isLoadingResetPassword, errorForgotEmail: $errorForgotEmail, errorVerifyCode: $errorVerifyCode, errorResetPassword: $errorResetPassword, forgotEmail: $forgotEmail, forgotCode: $forgotCode, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 bool? isLoginLoading, String? loginError, bool? loginSuccess, bool? isSignupLoading, String? signupError, bool? signupSuccess, bool? isLoadingForgotEmail, bool? isLoadingVerifyCode, bool? isLoadingResetPassword, String? errorForgotEmail, String? errorVerifyCode, String? errorResetPassword, String? forgotEmail, String? forgotCode, UserModel? user
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoginLoading = freezed,Object? loginError = freezed,Object? loginSuccess = freezed,Object? isSignupLoading = freezed,Object? signupError = freezed,Object? signupSuccess = freezed,Object? isLoadingForgotEmail = freezed,Object? isLoadingVerifyCode = freezed,Object? isLoadingResetPassword = freezed,Object? errorForgotEmail = freezed,Object? errorVerifyCode = freezed,Object? errorResetPassword = freezed,Object? forgotEmail = freezed,Object? forgotCode = freezed,Object? user = freezed,}) {
  return _then(_AuthState(
isLoginLoading: freezed == isLoginLoading ? _self.isLoginLoading : isLoginLoading // ignore: cast_nullable_to_non_nullable
as bool?,loginError: freezed == loginError ? _self.loginError : loginError // ignore: cast_nullable_to_non_nullable
as String?,loginSuccess: freezed == loginSuccess ? _self.loginSuccess : loginSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isSignupLoading: freezed == isSignupLoading ? _self.isSignupLoading : isSignupLoading // ignore: cast_nullable_to_non_nullable
as bool?,signupError: freezed == signupError ? _self.signupError : signupError // ignore: cast_nullable_to_non_nullable
as String?,signupSuccess: freezed == signupSuccess ? _self.signupSuccess : signupSuccess // ignore: cast_nullable_to_non_nullable
as bool?,isLoadingForgotEmail: freezed == isLoadingForgotEmail ? _self.isLoadingForgotEmail : isLoadingForgotEmail // ignore: cast_nullable_to_non_nullable
as bool?,isLoadingVerifyCode: freezed == isLoadingVerifyCode ? _self.isLoadingVerifyCode : isLoadingVerifyCode // ignore: cast_nullable_to_non_nullable
as bool?,isLoadingResetPassword: freezed == isLoadingResetPassword ? _self.isLoadingResetPassword : isLoadingResetPassword // ignore: cast_nullable_to_non_nullable
as bool?,errorForgotEmail: freezed == errorForgotEmail ? _self.errorForgotEmail : errorForgotEmail // ignore: cast_nullable_to_non_nullable
as String?,errorVerifyCode: freezed == errorVerifyCode ? _self.errorVerifyCode : errorVerifyCode // ignore: cast_nullable_to_non_nullable
as String?,errorResetPassword: freezed == errorResetPassword ? _self.errorResetPassword : errorResetPassword // ignore: cast_nullable_to_non_nullable
as String?,forgotEmail: freezed == forgotEmail ? _self.forgotEmail : forgotEmail // ignore: cast_nullable_to_non_nullable
as String?,forgotCode: freezed == forgotCode ? _self.forgotCode : forgotCode // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}


}

// dart format on
