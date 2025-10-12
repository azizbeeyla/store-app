import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_state.freezed.dart';

@freezed
abstract class OrdersState with _$OrdersState {
  const factory OrdersState({
    String? errorMessage,
    bool? loading,
    bool? success,
  }) = _OrdersState;

  factory OrdersState.initial() => const OrdersState(
    errorMessage: null,
    loading: false,
    success: false,
  );
}
