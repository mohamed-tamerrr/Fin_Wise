import 'dart:async';

import 'package:fin_wise/features/transactions/cubit/transaction_state.dart';
import 'package:fin_wise/features/transactions/data/models/transaction_model.dart';
import 'package:fin_wise/features/transactions/data/repo/transaction_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit(this.repo) : super(TransactionLoading());

  final TransactionRepo repo;
  StreamSubscription<List<TransactionModel>>? _sub;

  void watchAll() {
    _sub?.cancel();
    emit(TransactionLoading());
    _sub = repo.watchAllTransactions().listen(
      (list) {
        emit(TransactionSuccess(list));
      },
      onError: (e) {
        emit(TransactionFailure(e.toString()));
      },
    );
  }

  void watchByCategory(int categoryId) {
    _sub?.cancel();
    emit(TransactionLoading());
    _sub = repo
        .watchByCategory(categoryId)
        .listen(
          (list) => emit(TransactionSuccess(list)),
          onError: (e) => emit(TransactionFailure(e.toString())),
        );
  }

  Future<void> addTransaction(
    TransactionModel transaction,
  ) async {
    try {
      await repo.saveTransaction(transaction);
    } catch (e) {
      emit(TransactionFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
