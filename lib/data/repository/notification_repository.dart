import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/data/model/notification_model.dart';
import '../../core/client/result.dart';

class NotificationRepository {
  final ApiClient _apiClient;

  NotificationRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  Future<Result<List<NotificationModel>>> getNotifications() async {
    final result = await _apiClient.get('/notifications/list');

    return result.fold(
      (e) => Result.error(e),
      (data) {
        if (data is List) {
          final notifications = data
              .map((x) => NotificationModel.fromJson(x))
              .toList();

          return Result.ok(notifications);
        } else {
          return Result.error(Exception("Xatolik"));
        }
      },
    );
  }
}
