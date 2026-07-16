part of 'summary_cubit.dart';

@immutable
sealed class SummaryState {}

final class SummaryInitial extends SummaryState {}

final class SummaryLoading extends SummaryState {}

final class SummarySuccess extends SummaryState {
  SummarySuccess(this.summary);
  SummaryModel summary;
}

final class SummaryFailure extends SummaryState {
  SummaryFailure(this.errorMessage);
  String errorMessage;
}
