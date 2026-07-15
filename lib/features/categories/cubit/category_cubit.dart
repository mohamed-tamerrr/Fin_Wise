import '../data/models/category_model.dart';
import '../data/repos/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.categoryRepo}) : super(CategoryInitial());
  final CategoryRepository categoryRepo;

  /// Get Categories
  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await categoryRepo.getCategories();
      emit(CategorySuccess(categories));
    } catch (e) {
      emit(CategoryFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addCategory(CategoryModel category) async {
    try {
      await categoryRepo.saveCategory(category);
      await getCategories();
    } catch (e) {
      emit(CategoryFailure(errorMessage: e.toString()));
    }
  }

  Future<void> deleteCategory(int id) async {
    try {
      await categoryRepo.deleteCategory(id);
      await getCategories();
    } catch (e) {
      emit(CategoryFailure(errorMessage: e.toString()));
    }
  }
}
