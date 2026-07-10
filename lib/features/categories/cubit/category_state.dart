part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  CategorySuccess(this.categories);
  final List<CategoryModel> categories;
}

final class CategoryFailure extends CategoryState {
  CategoryFailure({required this.errorMessage});
  final String errorMessage;
}
