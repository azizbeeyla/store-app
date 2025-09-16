import 'package:bloc/bloc.dart';
import 'package:store_app/data/repository/product_repository.dart';
import 'package:store_app/features/home/managers/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepo;

  ProductCubit({required ProductRepository productRepo})
    : _productRepo = productRepo,
      super(ProductState());

  Future<void> fetchProduct(int categoryId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _productRepo.getProductsByCategory(categoryId);

    result.fold(
      (e) => emit(state.copyWith(errorMessage: e.toString(), isLoading: false)),

      (date) {

        emit(

        state.copyWith(isLoading: false, products: date, errorMessage: null),
      );
      },
    );
  }
}
