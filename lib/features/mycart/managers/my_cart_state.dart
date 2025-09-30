import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/cart_model.dart';

part 'my_cart_state.freezed.dart';

@freezed
abstract class MyCartState with _$MyCartState {
  const factory MyCartState({
    String? errorMessage,
    required bool loading,
    CartModel? cart,
  }) = _MyCartState;

  factory MyCartState.initial() => MyCartState(
    errorMessage: null,
    loading: false,
    cart: CartModel(
      items: [],
      subTotal: 0,
      vat: 0,
      shippingFee: 0,
      total: 0,
    ),
  );

}
