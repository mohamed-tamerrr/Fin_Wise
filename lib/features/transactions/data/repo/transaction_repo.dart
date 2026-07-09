import 'package:fin_wise/core/database/isar_service.dart';
import 'package:fin_wise/features/transactions/data/models/transaction_model.dart';
import 'package:isar/isar.dart';

class TransactionRepo {
  /// Add / Update Transaction
  Future<void> saveTransaction(
    TransactionModel transaction,
  ) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.transactionModels.put(transaction);
    });
  }

  /// Get Transactions
  Future<List<TransactionModel>> getTransactions() async {
    return await IsarService.isar.transactionModels
        .where()
        .findAll();
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
    return IsarService.isar.transactionModels.where().watch(
      fireImmediately: true,
    );
  }

  Stream<List<TransactionModel>> watchByCategory(
    int categoryId,
  ) {
    return IsarService.isar.transactionModels
        .filter()
        .categoryIdEqualTo(categoryId)
        .watch(fireImmediately: true);
  }
}
