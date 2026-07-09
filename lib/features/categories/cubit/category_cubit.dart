import 'package:bloc/bloc.dart';
import 'package:fin_wise/features/categories/data/models/category_model.dart';
import 'package:fin_wise/features/categories/data/repos/category_repository.dart';
import 'package:meta/meta.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.categoryRepo})
    : super(CategoryInitial());
  final CategoryRepository categoryRepo;

  /// Get Categories
  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      await categoryRepo.seedDefaultCategoriesIfNeeded();
      final categories = await categoryRepo.getCategories();
      emit(CategorySuccess(categories));
    } catch (e) {
      emit(CategoryFailure(errorMessage: e.toString()));
    }
  }
}
