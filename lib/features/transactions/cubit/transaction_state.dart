import '../data/models/transaction_model.dart';

sealed class TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  TransactionSuccess(this.transactions);
  final List<TransactionModel> transactions;
}

class TransactionFailure extends TransactionState {
  TransactionFailure(this.errorMessage);
  final String errorMessage;
}
