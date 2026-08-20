import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/widgets/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/model/analysis_model.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.buckets});
  final List<AnalyticsBucket> buckets;

  List<BarChartGroupData> _buildBarGroups() {
    return buckets.asMap().entries.map((e) {
      final index = e.key;
      final bucket = e.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: bucket.income,
            color: AppColors.primary,
            width: 8.w,
            borderRadius: BorderRadius.circular(4.r),
          ),
          BarChartRodData(
            toY: bucket.expense,
            color: AppColors.oceanBlueButton,
            width: 8.w,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ],
        barsSpace: 4,
      );
    }).toList();
  }

  double get _maxY {
    final maxVal = buckets.expand((b) => [b.income, b.expense]).fold<double>(0, (max, v) => v > max ? v : max);
    return (maxVal * 1.2).clamp(1000, double.infinity); // 20% headroom, avoid a flat 0-max chart
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: _maxY,
          minY: 0,

          gridData: FlGridData(
            checkToShowHorizontalLine: (value) => true,
            drawVerticalLine: false,
            horizontalInterval: 5000,
            getDrawingHorizontalLine: (value) => const FlLine(
              color: Color(0xff6DB6FE),
              strokeWidth: 1,
              dashArray: [3, 4],
            ),
          ),

          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(color: Colors.black, width: 1),
              left: BorderSide.none,
              right: BorderSide.none,
              top: BorderSide.none,
            ),
          ),

          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 15000,
                color: const Color(0xff6DB6FE),
                strokeWidth: 1,
                dashArray: [3, 4],
              ),
            ],
          ),

          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 5000,
                reservedSize: 36.w,
                getTitlesWidget: (value, meta) => CustomText(
                  text: '${(value / 1000).toInt()}k',
                  style: AppStyles.regular14.copyWith(
                    color: const Color(0xff6DB6FE),
                  ),
                ),
              ),
            ),

            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28.h,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= buckets.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: CustomText(
                      text: buckets[index].label,
                      style: AppStyles.regular14.copyWith(
                        color: AppColors.lettersandIcons,
                      ),
                    ),
                  );
                },
              ),
            ),

            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),

          barGroups: _buildBarGroups(),
        ),
      ),
    );
  }
}
