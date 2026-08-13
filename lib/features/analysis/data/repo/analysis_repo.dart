import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../../categories/data/models/category_model.dart';
import '../../../transactions/data/models/transaction_details_model.dart';
import '../../../transactions/data/models/transaction_model.dart';
import '../model/analysis_model.dart';

class AnalysisRepo {
  AnalysisRepo({required this.isar});
  final Isar isar;

  Future<AnalyticsModel> getDailyAnalysis() async {
    /// Get the start and end of the week
    final now = DateTime.now();
    final startOfWeek = DateTime(now.year, now.month, now.day).subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 7));

    /// Create a list of buckets for each day of the week
    List<AnalyticsBucket> buckets = [];
    for (int i = 0; i < 7; i++) {
      final day = startOfWeek.add(Duration(days: i));
      buckets.add(AnalyticsBucket(date: day, label: DateFormat('E').format(day)));
    }

    /// Get all transactions for the week
    final transactions = await isar.transactionModels.filter().dateBetween(startOfWeek, endOfWeek).findAll();

    /// Create a list of transaction details
    List<TransactionDetailsModel?> transactionsDetails = [];
    for (var t in transactions) {
      final category = await isar.categoryModels.get(t.categoryId);
      transactionsDetails.add(
        TransactionDetailsModel(
          transaction: t,
          category: category,
        ),
      );
    }

    /// fill the buckets with the transactions
    for (var t in transactionsDetails) {
      final bucket = buckets.firstWhere(
        (b) =>
            b.date.year == t!.transaction.date.year &&
            b.date.month == t.transaction.date.month &&
            b.date.day == t.transaction.date.day,
      );
      if (t!.isExpense) {
        bucket.expense += t.transaction.amount;
      } else if (t.isIncome) {
        bucket.income += t.transaction.amount;
      } else {
        continue;
      }
    }

    return AnalyticsModel(buckets: buckets, period: AnalyticsPeriod.daily);
  }

  Future<AnalyticsModel> getWeeklyAnalysis() async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 1);

    List<AnalyticsBucket> buckets = [];
    for (int i = 0; i < 4; i++) {
      final weekStart = startOfMonth.add(Duration(days: i * 7));
      buckets.add(AnalyticsBucket(date: weekStart, label: 'Week ${i + 1}'));
    }
    final transactions = await isar.transactionModels.filter().dateBetween(startOfMonth, endOfMonth).findAll();

    List<TransactionDetailsModel?> transactionsDetails = [];
    for (var t in transactions) {
      final category = await isar.categoryModels.get(t.categoryId);
      transactionsDetails.add(
        TransactionDetailsModel(
          transaction: t,
          category: category,
        ),
      );
    }
    for (var t in transactionsDetails) {
      final bucket = buckets.firstWhere(
        (b) => !b.date.isAfter(t!.transaction.date) && t.transaction.date.isBefore(b.date.add(const Duration(days: 7))),
      );
      if (t!.isExpense) {
        bucket.expense += t.transaction.amount;
      } else if (t.isIncome) {
        bucket.income += t.transaction.amount;
      } else {
        continue;
      }
    }

    return AnalyticsModel(buckets: buckets, period: AnalyticsPeriod.weekly);
  }

  Future<AnalyticsModel> getMonthlyAnalysis() async {
    final now = DateTime.now();
    final startOfYear = DateTime(now.year, 1, 1);
    final endOfYear = DateTime(now.year + 1, 1, 1);

    List<AnalyticsBucket> buckets = [];
    for (int i = 0; i < 12; i++) {
      final month = DateTime(now.year, i + 1, 1);
      buckets.add(AnalyticsBucket(date: month, label: DateFormat('MMM').format(month)));
    }

    final transactions = await isar.transactionModels.filter().dateBetween(startOfYear, endOfYear).findAll();

    List<TransactionDetailsModel?> transactionsDetails = [];
    for (var t in transactions) {
      final category = await isar.categoryModels.get(t.categoryId);
      transactionsDetails.add(
        TransactionDetailsModel(
          transaction: t,
          category: category,
        ),
      );
    }

    for (var t in transactionsDetails) {
      final bucket = buckets.firstWhere(
        (b) => b.date.month == t!.transaction.date.month && b.date.year == t.transaction.date.year,
      );
      if (t!.isExpense) {
        bucket.expense += t.transaction.amount;
      } else if (t.isIncome) {
        bucket.income += t.transaction.amount;
      } else {
        continue;
      }
    }
    return AnalyticsModel(buckets: buckets, period: AnalyticsPeriod.monthly);
  }

  Future<AnalyticsModel> getYearlyAnalysis() async {
    final now = DateTime.now();

    final endOfYear = DateTime(now.year + 1, 1, 1);

    List<AnalyticsBucket> buckets = [];
    for (int i = 0; i < 5; i++) {
      final year = DateTime(now.year - i, 1, 1);
      buckets.add(AnalyticsBucket(date: year, label: year.year.toString()));
    }

    final transactions = await isar.transactionModels
        .filter()
        .dateBetween(DateTime(now.year - 4, 1, 1), endOfYear)
        .findAll();

    List<TransactionDetailsModel?> transactionsDetails = [];
    for (var t in transactions) {
      final category = await isar.categoryModels.get(t.categoryId);
      transactionsDetails.add(
        TransactionDetailsModel(
          transaction: t,
          category: category,
        ),
      );
    }

    for (var t in transactionsDetails) {
      final bucket = buckets.firstWhere(
        (b) => b.date.year == t!.transaction.date.year,
      );
      if (t!.isExpense) {
        bucket.expense += t.transaction.amount;
      } else if (t.isIncome) {
        bucket.income += t.transaction.amount;
      } else {
        continue;
      }
    }
    return AnalyticsModel(buckets: buckets, period: AnalyticsPeriod.yearly);
  }
}
