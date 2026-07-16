class SummaryModel {
  SummaryModel({required this.income, required this.expense});
  final double income;
  final double expense;

  double get balance {
    if (income - expense <= 0) return 0;
    return income - expense;
  }
}
