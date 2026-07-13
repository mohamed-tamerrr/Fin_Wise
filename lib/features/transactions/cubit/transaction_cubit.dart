import 'dart:async';

import '../data/models/transaction_details_model.dart';
import 'transaction_state.dart';
import '../data/models/transaction_model.dart';
import '../data/repo/transaction_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit({required this.transactionRepo}) : super(TransactionLoading());

  final TransactionRepo transactionRepo;
  StreamSubscription<List<TransactionDetailsModel>>? _sub;

  void watchAll() {
    _sub?.cancel();
    emit(TransactionLoading());
    _sub = transactionRepo.watchAllTransactionsWithCategory().listen(
      (list) => emit(TransactionSuccess(list)),
      onError: (e) => emit(TransactionFailure(e.toString())),
    );
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      await transactionRepo.saveTransaction(transaction);
    } catch (e) {
      emit(TransactionFailure(e.toString()));
    }
  }

  void watchByCategory(int categoryId) {
    _sub?.cancel();
    emit(TransactionLoading());
    _sub = transactionRepo
        .watchByCategory(categoryId)
        .listen(
          (list) => emit(TransactionSuccess(list)),
          onError: (e) => emit(TransactionFailure(e.toString())),
        );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
