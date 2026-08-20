import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../data/model/analysis_model.dart';
import 'chart.dart';
import 'icon_button.dart';
import 'legend_item.dart';
import '../../../shared/widgets/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IncomeExpenseChart extends StatelessWidget {
  const IncomeExpenseChart({super.key, required this.buckets});
  final List<AnalyticsBucket> buckets;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Income & Expenses',
                style: AppStyles.regular15,
              ),
              Row(
                children: [
                  const CustomIconButton(icon: Icons.search),
                  Gap(8.w),
                  const CustomIconButton(
                    icon: Icons.calendar_month_outlined,
                  ),
                ],
              ),
            ],
          ),

          Gap(16.h),

          // Chart
          Chart(buckets: buckets),

          Gap(12.h),

          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendItem(
                color: AppColors.primary,
                label: 'Income',
              ),
              Gap(24.w),
              LegendItem(
                color: AppColors.oceanBlueButton,
                label: 'Expenses',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
