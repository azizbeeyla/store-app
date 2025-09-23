import 'package:bloc/bloc.dart';
import 'package:store_app/data/repository/notification_repository.dart';
import 'package:store_app/features/notification/managers/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository _repository;

  NotificationCubit({required NotificationRepository repository})
    : _repository = repository,
      super(NotificationState.initial()){
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    emit(state.copyWith(errorMessage: null, loading: true));

    final result = await _repository.getNotifications();

    result.fold(
      (failure) => emit(
        state.copyWith(errorMessage: failure.toString(), loading: false),
      ),
      (data) => emit(
        state.copyWith(errorMessage: null, loading: false, notifications: data),
      ),
    );
  }
}
