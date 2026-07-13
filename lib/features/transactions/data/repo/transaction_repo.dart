import '../../../../core/database/isar_service.dart';
import '../../../categories/data/models/category_model.dart';
import '../models/transaction_model.dart';
import 'package:isar/isar.dart';
import '../models/transaction_details_model.dart';

//* Avoid N + 1 problem to enhance your perfromance
class TransactionRepo {
  TransactionRepo(this._isar);
  final Isar _isar;

  /// Add / Update Transaction
  Future<void> saveTransaction(
    TransactionModel transaction,
  ) async {
    await _isar.writeTxn(() async {
      await _isar.transactionModels.put(transaction);
    });
  }

  /// Get Transactions 2 database queries total (batched), regardless of list size
  Future<List<TransactionDetailsModel>> getTransactions() async {
    final List<TransactionModel> transactions = await _isar.transactionModels.where().findAll();
    final categoriesId = transactions.map((e) => e.categoryId).toSet().toList();
    final categories = await _isar.categoryModels.getAll(categoriesId);
    final categoryMap = {for (final c in categories.whereType<CategoryModel>()) c.id: c};
    return transactions
        .map((e) => TransactionDetailsModel(transaction: e, category: categoryMap[e.categoryId]))
        .toList();
  }

  /// Get Transaction By ID
  Future<TransactionModel?> getTransactionById(int id) async {
    return await _isar.transactionModels.get(id);
  }

  /// Delete Transaction
  Future<void> deleteTransaction(int id) async {
    await _isar.writeTxn(() async {
      await _isar.transactionModels.delete(id);
    });
  }

  Stream<List<TransactionModel>> watchAllTransactions() {
    return _isar.transactionModels.where().sortByDateDesc().watch(
      fireImmediately: true,
    );
  }

  Stream<List<TransactionDetailsModel>> watchAllTransactionsWithCategory() {
    return watchAllTransactions().asyncMap((transactions) async {
      final categoryIds = transactions.map((t) => t.categoryId).toSet().toList();
      final categories = await _isar.categoryModels.getAll(categoryIds);
      final categoryMap = {
        for (final c in categories.whereType<CategoryModel>()) c.id: c,
      };

      return transactions
          .map(
            (t) => TransactionDetailsModel(
              transaction: t,
              category: categoryMap[t.categoryId],
            ),
          )
          .toList();
    });
  }

  Stream<List<TransactionDetailsModel>> watchByCategory(int categoryId) {
    return _isar.transactionModels
        .filter()
        .categoryIdEqualTo(categoryId)
        .sortByDateDesc()
        .watch(fireImmediately: true)
        .asyncMap((transactions) async {
          final category = await _isar.categoryModels.get(categoryId);

          return transactions
              .map(
                (t) => TransactionDetailsModel(
                  transaction: t,
                  category: category,
                ),
              )
              .toList();
        });
  }
}
