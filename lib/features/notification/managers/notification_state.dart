import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/notification_model.dart';

part 'notification_state.freezed.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    String? errorMessage,
    bool? loading,
     List<NotificationModel>? notifications,
  }) = _NotificationState;

  factory NotificationState.initial() =>
      NotificationState(errorMessage: null, loading: true, notifications: []);
}
