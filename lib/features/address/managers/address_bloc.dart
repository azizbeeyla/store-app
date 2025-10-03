import 'package:bloc/bloc.dart';
import 'package:store_app/data/repository/address_repository.dart';
import 'package:store_app/features/address/managers/address_event.dart';
import 'package:store_app/features/address/managers/address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository _repo;

  AddressBloc({required AddressRepository addressRepo})
      : _repo = addressRepo,
        super(AddressState.initial()) {
    on<AddressListEvent>(_onLoadAddresses);
    on<SelectAddressEvent>(_onSelectAddress);

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

  void _onSelectAddress(
      SelectAddressEvent event,
      Emitter<AddressState> emit,
      ) {
    emit(state.copyWith(selectedAddressId: event.selectedId));
  }
}
