import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

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
          BarChartRodData(
            toY: income,
            color: AppColors.oceanBlueButton,
            width: 8.w,
            borderRadius: BorderRadius.circular(4.r),
          ),
          BarChartRodData(
            toY: expense,
            color: AppColors.primary,
            width: 8.w,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ],
        barsSpace: 4,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 15000,
          minY: 1000,

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
                  const days = [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun',
                  ];

                  return Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: CustomText(
                      text: days[value.toInt()],
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
