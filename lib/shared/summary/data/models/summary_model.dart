import 'package:intl/intl.dart';

class SummaryModel {
  SummaryModel({required this.income, required this.expense});

  final double income;
  final double expense;

  static final NumberFormat _currencyFormat = NumberFormat.currency(
    symbol: '\$',
    decimalDigits: 2,
  );

  /// e.g. "$7,783.00"
  String get formattedIncome => _currencyFormat.format(income);

  /// e.g. "-$1,187.40"
  String get formattedExpense => '-${_currencyFormat.format(expense.abs())}';

  double get balance {
    if (income - expense <= 0) return 0;
    return income - expense;
  }

  /// e.g. "$6,595.60"
  String get formattedBalance => _currencyFormat.format(balance);

  double get expenseRatio => income == 0 ? 0 : (expense / income).clamp(0.0, 1.0);
}
