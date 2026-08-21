import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/widgets/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../data/model/analysis_model.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.buckets});
  final List<AnalyticsBucket> buckets;

  // Bar thickness shrinks as bucket count grows, so groups don't collide.
  double get _barWidth {
    if (buckets.length <= 7) return 10.w;
    if (buckets.length <= 12) return 6.w;
    return 4.w;
  }

  // Space between each group of bars (e.g. between "Jan" and "Feb").
  double get _groupsSpace {
    if (buckets.length <= 7) return 16.w;
    if (buckets.length <= 12) return 8.w;
    return 5.w;
  }

  // Label font shrinks as bucket count grows, so text doesn't overlap.
  double get _labelFontSize {
    if (buckets.length <= 7) return 13.sp;
    if (buckets.length <= 12) return 10.sp;
    return 11.sp;
  }

  double get _maxY {
    final maxVal = buckets.expand((b) => [b.income, b.expense]).fold<double>(0, (max, v) => v > max ? v : max);
    // round headroom up to a clean interval so gridlines land on tidy numbers
    final headroom = maxVal * 1.25;
    final interval = _yInterval(headroom);
    return ((headroom / interval).ceil() * interval).clamp(1000, double.infinity);
  }

  double _yInterval(double maxVal) {
    if (maxVal <= 5000) return 1000;
    if (maxVal <= 20000) return 5000;
    if (maxVal <= 50000) return 10000;
    return 25000;
  }

  String _formatCompact(double value) {
    if (value >= 1000) {
      final k = value / 1000;
      return k == k.roundToDouble() ? '${k.toInt()}k' : '${k.toStringAsFixed(1)}k';
    }
    return value.toInt().toString();
  }

  LinearGradient _barGradient(Color color) {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [color.withValues(alpha: 0.55), color],
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return buckets.asMap().entries.map((e) {
      final index = e.key;
      final bucket = e.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: bucket.income,
            gradient: _barGradient(AppColors.primary),
            width: _barWidth,
            borderRadius: BorderRadius.vertical(top: Radius.circular(6.r)),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: _maxY,
              color: AppColors.lettersandIcons.withValues(alpha: 0.06),
            ),
          ),
          BarChartRodData(
            toY: bucket.expense,
            gradient: _barGradient(AppColors.oceanBlueButton),
            width: _barWidth,
            borderRadius: BorderRadius.vertical(top: Radius.circular(6.r)),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: _maxY,
              color: AppColors.lettersandIcons.withValues(alpha: 0.06),
            ),
          ),
        ],
        barsSpace: 4.w,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final interval = _yInterval(_maxY);

    return SizedBox(
      height: 180.h,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          groupsSpace: _groupsSpace,
          maxY: _maxY,
          minY: 0,

          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => AppColors.lettersandIcons,
              tooltipBorderRadius: BorderRadius.all(Radius.circular(8.r)),
              tooltipPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              tooltipMargin: 8.h,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final isIncome = rodIndex == 0;
                return BarTooltipItem(
                  '${isIncome ? 'Income' : 'Expense'}\n',
                  AppStyles.regular12.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 10.sp,
                  ),
                  children: [
                    TextSpan(
                      text: NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(rod.toY),
                      style: AppStyles.medium13.copyWith(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: interval,
            getDrawingHorizontalLine: (value) => FlLine(
              color: AppColors.lettersandIcons.withValues(alpha: 0.08),
              strokeWidth: 1,
            ),
          ),

          borderData: FlBorderData(show: false),

          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: interval,
                reservedSize: 38.w,
                getTitlesWidget: (value, meta) {
                  if (value == 0) return const SizedBox.shrink();
                  return CustomText(
                    text: _formatCompact(value),
                    style: AppStyles.regular14.copyWith(
                      color: AppColors.lettersandIcons.withValues(alpha: 0.5),
                      fontSize: 11.sp,
                    ),
                  );
                },
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
                  // For crowded axes (e.g. 12 months), skip every other label.
                  if (buckets.length > 7 && index.isOdd) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: CustomText(
                      text: buckets[index].label,
                      style: AppStyles.regular14.copyWith(
                        color: AppColors.lettersandIcons.withValues(alpha: 0.6),
                        fontSize: _labelFontSize,
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
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      ),
    );
  }
}
