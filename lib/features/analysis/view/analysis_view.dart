import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/analysis/widgets/analysis_tabs.dart';
import 'package:fin_wise/features/analysis/widgets/chart.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: CustomScrollView(
        slivers: [
          CusomAppBar(
            topRow: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Analysis',
                  color: AppColors.secondaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: .2),
                  ),
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(
                left: 36,
                right: 36,
                top: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  AnalysisTabs(),
                  Gap(30),
                  // IncomeExpenseChart(),
                  AspectRatio(
                    aspectRatio: 1,
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(show: false),
                        maxY: 15000,
                        minY: 0,
                        backgroundColor: AppColors.secondary,
                        alignment: BarChartAlignment.spaceAround,

                        titlesData: FlTitlesData(
                          // show: false,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              reservedSize: 40,
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const days = [
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat',
                                  'Sun',
                                ];
                                return SideTitleWidget(
                                  meta: meta,
                                  child: CustomText(
                                    text: days[value.toInt()],
                                    color: AppColors.textColor,
                                  ),
                                );
                              },
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                        ),
                        barGroups: _buildBarGroups(),
                      ),
                    ),
                  ),
                  // Gap(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    // [income, expense] per day
    final data = [
      [8000.0, 1000.0], // Mon
      [2000.0, 1500.0], // Tue
      [6000.0, 1000.0], // Wed
      [3000.0, 1000.0], // Thu
      [10000.0, 1000.0], // Fri
      [2000.0, 1500.0], // Sat
      [6000.0, 5000.0], // Sun
    ];

    return data.asMap().entries.map((e) {
      final index = e.key;
      final income = e.value[0];
      final expense = e.value[1];

      return BarChartGroupData(
        x: index,
        barRods: [
          // Income bar (blue)
          BarChartRodData(
            toY: income,
            color: AppColors.expenses,
            width: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          // Expense bar (green)
          BarChartRodData(
            toY: expense,
            color: AppColors.primary,
            width: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
        barsSpace: 4, // space between the two bars
      );
    }).toList();
  }
}
