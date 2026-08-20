part of 'analysis_cubit.dart';

@immutable
sealed class AnalysisState {}

final class AnalysisInitial extends AnalysisState {}

final class AnalysisLoading extends AnalysisState {}

final class AnalysisSuccess extends AnalysisState {
  AnalysisSuccess(this.model);
  AnalyticsModel model;
}

final class AnalysisError extends AnalysisState {
  AnalysisError(this.message);
  String message;
}
