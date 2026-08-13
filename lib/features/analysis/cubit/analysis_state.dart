part of 'analysis_cubit.dart';

@immutable
sealed class AnalysisState {}

final class AnalysisInitial extends AnalysisState {}

final class AnalysisLoading extends AnalysisState {}

final class AnalysisSuccess extends AnalysisState {
  AnalyticsModel model;
  AnalysisSuccess(this.model);
}

final class AnalysisError extends AnalysisState {
  String message;
  AnalysisError(this.message);
}
