import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/order_model.dart';
part 'order_state.freezed.dart';
@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState({
    bool? isCreateLoad,
    bool? isOrderLoad,
    bool? createSuccess,
    String? createError,
    String? orderError,
    List<OrderModel>? orders,
    int? selectedIndex,
  }) = _OrderState;
  factory OrderState.initial() => OrderState(
    isCreateLoad: false,
    isOrderLoad: false,
    createError: null,
    orderError: null,
    selectedIndex: 0,
    orders: [],
    createSuccess: false,
  );
}
