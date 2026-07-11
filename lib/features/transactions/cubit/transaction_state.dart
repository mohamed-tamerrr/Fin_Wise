import '../data/models/transaction_model.dart';
import '../data/models/transaction_details_model.dart';

sealed class TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  TransactionSuccess(this.transactions);
  final List<TransactionDetailsModel> transactions;
}

class TransactionFailure extends TransactionState {
  TransactionFailure(this.errorMessage);
  final String errorMessage;
}
