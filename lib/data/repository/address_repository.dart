import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';
import 'package:store_app/data/model/address_model.dart';

class AddressRepository {
  final ApiClient _apiClient;

  AddressRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<AddressModel>>> getAddressList() async {
    var response = await _apiClient.get('/addresses');

    return response.fold(
      (error) => Result.error(error),
      (data) {
        final addresses = (data as List)
            .map((x) => AddressModel.fromJson(Map<String, dynamic>.from(x)))
            .toList();

        return Result.ok(addresses);
      },
    );
  }

  Future<Result<AddressModel>> newAddress(AddressModel address) async {
    final body = {
      'nickname': address.title,
      'fullAddress': address.fullAddress,
      'lat': address.lat,
      'lng': address.lng,
      'isDefault': address.isDefault,
    };
    var response = await _apiClient.post('/addresses', data: body);

    return response.fold((error) => Result.error(error), (data) {
      final newAddress = AddressModel.fromJson(Map<String, dynamic>.from(data));
      return Result.ok(newAddress);
    });
  }
}
