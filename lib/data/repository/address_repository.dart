import 'package:store_app/core/client/dio_client.dart';
import 'package:store_app/core/client/result.dart';
import 'package:store_app/data/model/address_model.dart';

class AddressRepository {
  
  
  final ApiClient _apiClient;

  AddressRepository({required ApiClient apiClient}) : _apiClient = apiClient;
  
  
  Future<Result<List<AddressModel>>> getAddressList()async{
    
    var response = await _apiClient.get('/addresses/list');
    return response.fold((error)=>Result.error(error), (data){

      final addresses = (data)
          .map((x) => AddressModel.fromJson(Map<String, dynamic>.from(x)))
          .toList();
      return Result.ok(addresses);
    });
  }

}