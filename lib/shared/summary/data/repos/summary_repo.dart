import '../../../../features/transactions/data/models/transaction_details_model.dart';
import '../../../../features/transactions/data/repo/transaction_repo.dart';
import '../models/summary_model.dart';

class SummaryRepo {
  SummaryRepo(this._transactionsRepo);
  final TransactionRepo _transactionsRepo;

  Stream<SummaryModel> watchSummary() {
    return _transactionsRepo.watchAllTransactionsWithCategory().map(_toSummary);
  }

  Stream<SummaryModel> watchSummaryByCategory(int categoryId) {
    return _transactionsRepo.watchByCategory(categoryId).map(_toSummary);
  }

  SummaryModel _toSummary(List<TransactionDetailsModel> transactions) {
    double income = 0;
    double expense = 0;
    for (TransactionDetailsModel t in transactions) {
      if (t.isIncome) {
        income += t.transaction.amount;
      }
      if (t.isExpense) {
        expense += t.transaction.amount;
      }
    }
    return SummaryModel(income: income, expense: expense);
  }
}
