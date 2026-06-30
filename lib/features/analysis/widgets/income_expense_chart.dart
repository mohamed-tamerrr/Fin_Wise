import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/analysis/widgets/chart.dart';
import 'package:fin_wise/features/analysis/widgets/icon_button.dart';
import 'package:fin_wise/features/analysis/widgets/legend_item.dart';
import 'package:fin_wise/shared/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IncomeExpenseChart extends StatelessWidget {
  const IncomeExpenseChart({super.key});

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
                  ChartIcon(icon: Icons.search),
                  Gap(8.w),
                  ChartIcon(icon: Icons.calendar_month_outlined),
                ],
              ),
            ],
          ),

          Gap(16.h),

          // Chart
          Chart(),

          Gap(12.h),

          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendItem(
                color: AppColors.oceanBlueButton,
                label: 'Income',
              ),
              Gap(24.w),
              LegendItem(
                color: AppColors.primary,
                label: 'Expenses',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
