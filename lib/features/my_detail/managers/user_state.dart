import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/user_model.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    String? errorMessage,
    bool? loading,
    UserModel? user,
  }) = _UserState;

  factory UserState.initial() => UserState(
    errorMessage: null,
    loading: true,
    user: null,
  );
}
