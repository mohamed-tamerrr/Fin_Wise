import '../../../../core/database/isar_service.dart';
import '../../../categories/data/models/category_model.dart';
import '../models/transaction_model.dart';
import 'package:isar/isar.dart';
import '../models/transaction_details_model.dart';

//* Avoid N + 1 problem to enhance your perfromance
class TransactionRepo {
  /// Add / Update Transaction
  Future<void> saveTransaction(
    TransactionModel transaction,
  ) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.transactionModels.put(transaction);
    });
  }

  /// Get Transactions 2 database queries total (batched), regardless of list size
  Future<List<TransactionDetailsModel>> getTransactions() async {
    final List<TransactionModel> transactions = await IsarService.isar.transactionModels.where().findAll();
    final categoriesId = transactions.map((e) => e.categoryId).toSet().toList();
    final categories = await IsarService.isar.categoryModels.getAll(categoriesId);
    final categoryMap = {for (final c in categories.whereType<CategoryModel>()) c.id: c};
    return transactions
        .map((e) => TransactionDetailsModel(transaction: e, category: categoryMap[e.categoryId]))
        .toList();
  }

  /// Get Transaction By ID
  Future<TransactionModel?> getTransactionById(int id) async {
    return await IsarService.isar.transactionModels.get(id);
  }

  /// Delete Transaction
  Future<void> deleteTransaction(int id) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.transactionModels.delete(id);
    });
  }

  Stream<List<TransactionModel>> watchAllTransactions() {
    return IsarService.isar.transactionModels.where().sortByDateDesc().watch(
      fireImmediately: true,
    );
  }

  Stream<List<TransactionDetailsModel>> watchAllTransactionsWithCategory() {
    return watchAllTransactions().asyncMap((transactions) async {
      final categoryIds = transactions.map((t) => t.categoryId).toSet().toList();
      final categories = await IsarService.isar.categoryModels.getAll(categoryIds);
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
    return IsarService.isar.transactionModels
        .filter()
        .categoryIdEqualTo(categoryId)
        .sortByDateDesc()
        .watch(fireImmediately: true)
        .asyncMap((transactions) async {
          final category = await IsarService.isar.categoryModels.get(categoryId);

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
