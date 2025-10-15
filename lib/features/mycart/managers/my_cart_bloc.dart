import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/cart_repository.dart';
import 'package:store_app/features/mycart/managers/my_cart_state.dart';
import 'my_cart_event.dart';

class CartBloc extends Bloc<MyCartEvent, MyCartState> {
  final CartRepository _repository;

  CartBloc({required CartRepository repository})
      : _repository = repository,
        super(MyCartState.initial()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
  }

  Future<void> _onLoadCart(
      LoadCart event,
      Emitter<MyCartState> emit,
      ) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final result = await _repository.getCartList();

    result.fold(
          (error) => emit(state.copyWith(
        errorMessage: error.toString(),
        loading: false,
      )),
          (cart) => emit(state.copyWith(
        cart: cart,
        loading: false,
      )),
    );
  }

  Future<void> _onAddToCart(
      AddToCart event,
      Emitter<MyCartState> emit,
      ) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final result = await _repository.addToCart(
      productId: event.productId,
      sizeId: event.sizeId,
    );

    await result.fold(
          (error) async {
        emit(state.copyWith(
          errorMessage: error.toString(),
          loading: false,
        ));
      },
          (_) async {
        final updatedList = await _repository.getCartList();
        updatedList.fold(
              (error) => emit(state.copyWith(
            errorMessage: error.toString(),
            loading: false,
          )),
              (cart) => emit(state.copyWith(
            cart: cart,
            loading: false,
          )),
        );
      },
    );
  }

  Future<void> _onRemoveFromCart(
      RemoveFromCart event,
      Emitter<MyCartState> emit,
      ) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _repository.removeFromCart(id: event.id);

    await result.fold(
          (error) async {
        emit(state.copyWith(
          errorMessage: error.toString(),
          loading: false,
        ));
      },
          (_) async {
        final updatedList = await _repository.getCartList();
        updatedList.fold(
              (error) => emit(state.copyWith(
            errorMessage: error.toString(),
            loading: false,
          )),
              (cart) => emit(state.copyWith(
            cart: cart,
            loading: false,
          )),
        );
      },
    );
  }
}
