import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/analysis/widgets/analysis_tabs.dart';
import 'package:fin_wise/features/analysis/widgets/income_expense_chart.dart';
import 'package:fin_wise/features/analysis/widgets/money_info.dart';
import 'package:fin_wise/features/analysis/widgets/target_item.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: CustomScrollView(
        slivers: [
          /// App Bar
          CustomAppBar(
            topRow: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Analysis',
                  style: AppStyles.semiBold20.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: .2),
                  ),
                  child: const Icon(Icons.notifications),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const BalanceRow(
                totalBalance: '\$7,783.00',
                totalExp: '-\$1,187.40',
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
                left: 36.w,
                right: 36.w,
                top: 16.h,
                bottom: 16.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(60.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AnalysisTabs(),
                  Gap(30.h),
                  const IncomeExpenseChart(),
                  Gap(30.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Row(
                      children: [
                        const MoneyInfo(
                          image: 'assets/Income.png',
                          title: 'Income',
                          amount: '\$4,120.00',
                        ),
                        const Spacer(),
                        MoneyInfo(
                          image: 'assets/Expenses.png',
                          title: 'Expense',
                          amount: '\$1.187.40',
                          color: AppColors.oceanBlueButton,
                        ),
                      ],
                    ),
                  ),
                  Gap(30.h),
                  CustomText(
                    text: 'My targets',
                    style: AppStyles.medium15,
                  ),
                  Gap(15.h),
                  Row(
                    children: [
                      const TargetItem(
                        title: 'Travel',
                        value: .3,
                        percentage: '30%',
                      ),
                      Gap(20.w),
                      const TargetItem(
                        title: 'Car',
                        value: .5,
                        percentage: '50%',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
