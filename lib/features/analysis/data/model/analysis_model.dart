enum AnalyticsPeriod { daily, weekly, monthly, yearly }

/// for each column - section of the chart
class AnalyticsBucket {
  AnalyticsBucket({required this.label, this.income = 0, this.expense = 0, required this.date});

  final String label;
  double income;
  double expense;
  final DateTime date;
}

/// Model for th e analytics data
class AnalyticsModel {
  AnalyticsModel({required this.buckets, required this.period});

  final List<AnalyticsBucket> buckets;
  final AnalyticsPeriod period;

  double get totalIncome => buckets.fold(0, (sum, b) => sum + b.income);
  double get totalExpense => buckets.fold(0, (sum, b) => sum + b.expense);
}
