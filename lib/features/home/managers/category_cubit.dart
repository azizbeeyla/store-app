import 'package:bloc/bloc.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/features/home/managers/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository _categoryRepo;

  CategoryCubit({required CategoryRepository categoryRepo})
    : _categoryRepo = categoryRepo,
      super(CategoryState());

  Future<void> fetchCategories() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _categoryRepo.getCategories();

    result.fold(
      (e) => emit(state.copyWith(isLoading: false, errorMessage: e.toString())),
      (data) => emit(
        state.copyWith(isLoading: false, errorMessage: null, categories: data),
      ),
    );
  }
}
