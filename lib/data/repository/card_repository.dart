import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';
import 'package:store_app/data/model/payment_model/add_cart_model.dart';
import 'package:store_app/data/model/payment_model/card_model.dart';

class CardRepository {
  final ApiClient _apiClient;

  CardRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<CardModel>>> getCards() async {
    var response = await _apiClient.get<List>('/cards/list');

    return response.fold(
          (error) => Result.error(error),
          (data) {
        final cards = (data)
            .map((x) => CardModel.fromJson(x))
            .toList();
        return Result.ok(cards);
      },
    );
  }

  Future<Result<void>> addCard(AddCardModel data) async {
    var response = await _apiClient.post("/cards/create", data: data.toJson());

    return response.fold(
          (error) => Result.error(error),
          (_) => Result.ok(null),
    );
  }
}
