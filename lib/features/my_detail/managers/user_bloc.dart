import 'package:bloc/bloc.dart';
import 'package:store_app/core/client/result.dart';
import 'package:store_app/data/repository/user_repository.dart';
import 'package:store_app/features/my_detail/managers/user_event.dart';
import 'package:store_app/features/my_detail/managers/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepo;

  UserBloc({required UserRepository userRepo})
    : _userRepo = userRepo,
      super(UserState.initial()){

    on<LoadUser>(_onLoadUser);
    on<UpdateUser>(_onUpdateUser);
    add(LoadUser());
  }

  Future<void> _onLoadUser(
    LoadUser event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final result = await _userRepo.getMe();

    result.fold(
      (error) {
        Result.error(error);
        emit(state.copyWith(loading: false, errorMessage: error.toString()));
      },
      (data) {
        Result.ok(data);
        emit(state.copyWith(loading: false, errorMessage: null, user: data));
      },
    );
  }

  Future<void> _onUpdateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _userRepo.updateUser(event.user);
    result.fold(
      (error) {
        Result.error(error);
        emit(state.copyWith(errorMessage: error.toString(), loading: false));
      },
      (data) {
        Result.ok(data);
        emit(state.copyWith(errorMessage: null, loading: false, user: data));
      },
    );
  }
}
