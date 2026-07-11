// features/transactions/cubit/transactions_filter_cubit.dart
import 'dart:async';

import '../../categories/data/models/category_model.dart';
import '../data/models/transaction_details_model.dart';
import 'transaction_state.dart'; // <-- same state file used by TransactionCubit
import '../data/repo/transaction_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsFilterCubit extends Cubit<TransactionState> {
  TransactionsFilterCubit(this.repo) : super(TransactionLoading());

  final TransactionRepo repo;
  StreamSubscription<List<TransactionDetailsModel>>? _sub;
  List<TransactionDetailsModel> _allItems = [];

  CategoryType? _typeFilter; // null = no type filter
  int? _categoryId; // null = no category filter

  CategoryType? get typeFilter => _typeFilter;
  int? get categoryFilter => _categoryId;

  void watchAll() {
    _sub?.cancel();
    emit(TransactionLoading());
    _sub = repo.watchAllTransactionsWithCategory().listen(
      (list) {
        _allItems = list;
        _emitFiltered();
      },
      onError: (e) => emit(TransactionFailure(e.toString())),
    );
  }

  void setTypeFilter(CategoryType filter) {
    _typeFilter = (_typeFilter == filter) ? null : filter;
    _emitFiltered();
  }

  void setCategoryFilter(int categoryId) {
    _categoryId = (_categoryId == categoryId) ? null : categoryId;
    _emitFiltered();
  }

  void clearFilters() {
    _typeFilter = null;
    _categoryId = null;
    _emitFiltered();
  }

  void _emitFiltered() {
    var filtered = _allItems;

    if (_typeFilter != null) {
      filtered = _typeFilter == CategoryType.income
          ? filtered.where((i) => i.isIncome).toList()
          : filtered.where((i) => i.isExpense).toList();
    }

    if (_categoryId != null) {
      filtered = filtered.where((i) => i.transaction.categoryId == _categoryId).toList();
    }

    emit(TransactionSuccess(filtered));
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
