import 'package:store_app/data/model/order_model.dart';
import '../../core/client/dio_client.dart';
import '../../core/client/result.dart';

class OrderRepository {
  final ApiClient _apiClient;

  OrderRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<void>> placeOrder({
    required int addressId,
    required int cardId,
    String paymentMethod = "Card",
  }) async {
    final body = {
      "addressId": addressId,
      "paymentMethod": paymentMethod,
      "cardId": cardId,
    };

    final response = await _apiClient.post('/orders/create', data: body);

    return response.fold(
          (error) => Result.error(error),
          (_) => const Result.ok(null),
    );
  }

  Future<Result<List<OrderModel>>> getOrderList() async {
    final response = await _apiClient.get<List>('/orders/list');

    return response.fold(
          (error) => Result.error(error),
          (data) {
        final orders = data.map((x) => OrderModel.fromJson(x)).toList();
        return Result.ok(orders);
      },
    );
  }
}
