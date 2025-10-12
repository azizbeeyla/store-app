import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/order_repository.dart';

import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrderRepository _repo;

  OrdersBloc({required OrderRepository orderRepository})
      : _repo = orderRepository,
        super(OrdersState.initial()) {
    on<CreateOrdersEvent>(_onCreateOrders);
  }

  Future<void> _onCreateOrders(
      CreateOrdersEvent event,
      Emitter<OrdersState> emit,
      ) async {
    emit(state.copyWith(loading: true, errorMessage: null, success: false));

    final result = await _repo.placeOrder(
      addressId: event.addressId,
      cardId: event.cardId,
      paymentMethod: event.paymentMethod,
    );

    result.fold(
          (error) {
        emit(state.copyWith(
          loading: false,
          errorMessage: error.toString(),
          success: false,
        ));
      },
          (_) {
        emit(state.copyWith(
          loading: false,
          errorMessage: null,
          success: true,
        ));
      },
    );
  }
}
