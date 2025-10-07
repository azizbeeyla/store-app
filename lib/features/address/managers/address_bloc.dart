import 'package:bloc/bloc.dart';
import 'package:store_app/data/repository/address_repository.dart';
import 'package:store_app/features/address/managers/address_event.dart';
import 'package:store_app/features/address/managers/address_state.dart';

import '../../../data/model/address_model.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository _repo;

  AddressBloc({required AddressRepository addressRepo})
    : _repo = addressRepo,
      super(AddressState.initial()) {
    on<AddressListEvent>(_onLoadAddresses);
    on<SelectAddressEvent>(_onSelectAddress);
    on<NewAddressEvent>(_onAddAddresses);
    add(AddressListEvent());
  }

  Future<void> _onLoadAddresses(
    AddressListEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _repo.getAddressList();

    result.fold(
      (error) {
        emit(state.copyWith(errorMessage: error.toString(), loading: false));
      },
      (addresses) {
        emit(
          state.copyWith(
            address: addresses,
            loading: false,
            selectedAddressId: addresses.isNotEmpty ? addresses.first.id : null,
          ),
        );
      },
    );
  }

  Future<void> _onAddAddresses(
    NewAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final result = await _repo.newAddress(event.address);
    result.fold(
      (error) {
        emit(state.copyWith(errorMessage: error.toString(), loading: false));
      },
      (newAddress) {
        final updatedList = List<AddressModel>.from(state.address ?? [])
          ..add(newAddress);

        emit(
          state.copyWith(
            address: updatedList,
            loading: false,
            selectedAddressId: newAddress.id,
          ),
        );
      },
    );
  }

  void _onSelectAddress(
    SelectAddressEvent event,
    Emitter<AddressState> emit,
  ) {
    emit(state.copyWith(selectedAddressId: event.selectedId));
  }
}
