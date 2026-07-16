import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/summary_model.dart';
import '../data/repos/summary_repo.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit(this._repository) : super(SummaryInitial());

  final SummaryRepo _repository;
  StreamSubscription<SummaryModel>? _sub;
  void getSummary() {
    _sub?.cancel();
    emit(SummaryLoading());

    _sub = _repository.watchSummary().listen(
      (summary) => emit(SummarySuccess(summary)),
      onError: (e) => emit(SummaryFailure(e.toString())),
    );
  }

  void watchByCategory(int categoryId) {
    emit(SummaryLoading());
    _sub?.cancel();
    _sub = _repository
        .watchSummaryByCategory(categoryId)
        .listen(
          (summary) => emit(SummarySuccess(summary)),
          onError: (e) => emit(SummaryFailure(e.toString())),
        );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
