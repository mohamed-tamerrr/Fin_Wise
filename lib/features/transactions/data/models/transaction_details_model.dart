import '../../../categories/data/models/category_model.dart';
import 'transaction_model.dart';

class TransactionDetailsModel {
  TransactionDetailsModel({
    required this.transaction,
    required this.category,
  });
  final TransactionModel transaction;
  final CategoryModel? category;

  bool get isExpense => category?.type == CategoryType.expense;

  bool get isIncome => category?.type == CategoryType.income;

  String get categoryName => category?.name ?? 'UnKnown';

  String get iconName => category?.iconName ?? 'default';
}
