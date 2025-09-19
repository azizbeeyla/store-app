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
      (e) => emit(
        state.copyWith(
          errorMessage: e.toString(),
          isLoading: false,
        ),
      ),
      (data) {
        emit(
          state.copyWith(
            isLoading: false,
            products: data,
            errorMessage: null,
            categoryId: categoryId,
          ),
        );
      },
    );
  }

  Future<void> fetchAllProducts() async {
    emit(state.copyWith(isLoading: true, errorMessage: null, categoryId: null));

    final result = await _productRepo.getAllProducts();

    result.fold(
      (e) => emit(
        state.copyWith(
          errorMessage: e.toString(),
          isLoading: false,
        ),
      ),
      (data) {
        emit(
          state.copyWith(
            isLoading: false,
            products: data,
            errorMessage: null,
            categoryId: 0,
          ),
        );
      },
    );
  }

  Future<void> saveProduct(int productId) async {
    final result = await _productRepo.saveProduct(productId);

    result.fold(
      (e) => emit(state.copyWith(errorMessage: e.toString())),
      (_) {
        final updatedProducts = state.products.map((p) {
          if (p.id == productId) {
            return p.copyWith(isLiked: true);
          }
          return p;
        }).toList();

        emit(state.copyWith(products: updatedProducts, errorMessage: null));
      },
    );
  }

  Future<void> unSaveProduct(int productId) async {
    final result = await _productRepo.unSaveProduct(productId);

    result.fold(
      (e) => emit(state.copyWith(errorMessage: e.toString())),
      (_) {
        final updatedProducts = state.products.map((p) {
          if (p.id == productId) {
            return p.copyWith(isLiked: false);
          }
          return p;
        }).toList();

        emit(state.copyWith(products: updatedProducts, errorMessage: null));
      },
    );
  }
}
