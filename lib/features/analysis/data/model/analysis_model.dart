enum AnalyticsPeriod { daily, weekly, monthly, yearly }

/// for each column - section of the chart
class AnalyticsBucket {
  AnalyticsBucket({required this.label, required this.income, required this.expense});

  final String label;
  final double income;
  final double expense;
}

/// Model for th e analytics data
class AnalyticsModel {
  AnalyticsModel({required this.buckets, required this.period});

  final List<AnalyticsBucket> buckets;
  final AnalyticsPeriod period;

  double get totalIncome => buckets.fold(0, (sum, b) => sum + b.income);
  double get totalExpense => buckets.fold(0, (sum, b) => sum + b.expense);
}
