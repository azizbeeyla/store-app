  import 'package:freezed_annotation/freezed_annotation.dart';
  import 'package:store_app/data/model/address_model.dart';

  part 'address_state.freezed.dart';

  @freezed
  abstract class AddressState with _$AddressState {
    const factory AddressState({
      String? errorMessage,
      bool? loading,
      List<AddressModel>? address,
      int? selectedAddressId,
    }) = _AddressState;

    factory AddressState.initial() => const AddressState(
      errorMessage: null,
      address: [],
      loading: true,
      selectedAddressId: null,
    );
  }
