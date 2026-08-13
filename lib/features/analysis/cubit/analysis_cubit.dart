import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/analysis_model.dart';
import '../data/repo/analysis_repo.dart';

part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit({required this.analysisRepo}) : super(AnalysisInitial());
  final AnalysisRepo analysisRepo;

  Future<void> getAnalysis(AnalyticsPeriod period) async {
    emit(AnalysisLoading());
    try {
      final AnalyticsModel result;
      switch (period) {
        case AnalyticsPeriod.daily:
          result = await analysisRepo.getDailyAnalysis();
          break;
        case AnalyticsPeriod.weekly:
          result = await analysisRepo.getWeeklyAnalysis();
          break;
        case AnalyticsPeriod.monthly:
          result = await analysisRepo.getMonthlyAnalysis();
          break;
        case AnalyticsPeriod.yearly:
          result = await analysisRepo.getYearlyAnalysis();
          break;
      }
      emit(AnalysisSuccess(result));
    } catch (e) {
      emit(AnalysisError(e.toString()));
    }
  }
}
