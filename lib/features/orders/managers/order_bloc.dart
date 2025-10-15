import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/order_repository.dart';
import 'package:store_app/features/orders/managers/order_event.dart';
import 'package:store_app/features/orders/managers/order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepo;
  int selectedIndex=0;

  OrderBloc({required OrderRepository orderRepo})
    : _orderRepo = orderRepo,
      super(OrderState.initial()) {
    on<PlaceOrderEvent>(_onPlaceOrder);
    on<GetOrderEvent>(_onLoadOrders);
    on<ChangeStatusEvent>(_onChangeStatus);

  }
  Future<void> _onPlaceOrder(
    PlaceOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(isCreateLoad: true, createError: null));

    final result = await _orderRepo.placeOrder(
      addressId: event.addressId,
      cardId: event.cardId,
    );
    result.fold(
      (error) {
        emit(
          state.copyWith(isCreateLoad: false, createError: error.toString()),
        );
      },
      (data) {
        emit(
          state.copyWith(
            isCreateLoad: false,
            createError: null,
            createSuccess: true,
          ),
        );
      },
    );
  }

  Future<void> _onLoadOrders(
    GetOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(isOrderLoad: true, orderError: null));

    final result = await _orderRepo.getOrderList();

    result.fold(
          (error) {
        emit(state.copyWith(isOrderLoad: false, createError: error.toString()));
      },
          (data) {
        emit(
          state.copyWith(isOrderLoad: false, orderError: null, orders: data),
        );
      },
    );
  }
  void _onChangeStatus(ChangeStatusEvent event, Emitter<OrderState> emit) {
    selectedIndex = event.selectedIndex;
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  List get filteredOrders {
    if (selectedIndex == 1) {
      return (state.orders ?? [])
          .where((order) => order.status == "Completed")
          .toList();
    } else {
      return (state.orders ?? [])
          .where((order) => order.status != "Completed")
          .toList();
    }
  }

}
