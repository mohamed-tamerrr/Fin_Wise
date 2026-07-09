import 'package:fin_wise/features/transactions/data/models/transaction_model.dart';

sealed class TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transactions;
  TransactionSuccess(this.transactions);
}

class TransactionFailure extends TransactionState {
  final String errorMessage;
  TransactionFailure(this.errorMessage);
}
