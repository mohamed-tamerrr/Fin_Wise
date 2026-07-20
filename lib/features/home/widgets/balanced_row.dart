import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'balance_item.dart';
import '../../../shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BalanceRow extends StatelessWidget {
  const BalanceRow({
    super.key,
    required this.totalBalance,
    required this.totalExp,
    required this.expenseRatio, // 0.0 to 1.0, e.g. 0.30
    required this.totalIncomeLabel, // formatted, e.g. "$20,000.00"
  });

  final String totalBalance, totalExp, totalIncomeLabel;
  final double expenseRatio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BalanceItem(
                title: 'Total Balance',
                amount: totalBalance,
                amountColor: AppColors.backgroundColor,
                icon: 'assets/Income.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 50.h,
                child: VerticalDivider(width: 1.w, color: AppColors.secondary),
              ),
            ),
            Expanded(
              child: BalanceItem(
                title: 'Total Expense',
                amount: totalExp,
                amountColor: AppColors.oceanBlueButton,
                icon: 'assets/Expenses.png',
              ),
            ),
          ],
        ),
        Gap(20.h),
        Stack(
          children: [
            // white background = full income
            Container(
              height: 40.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),
            // black fill = expense portion
            LayoutBuilder(
              builder: (context, constraints) {
                final barWidth = (constraints.maxWidth * expenseRatio).clamp(
                  60.w,
                  constraints.maxWidth,
                );
                return Container(
                  constraints: BoxConstraints(minHeight: 40.h),
                  width: barWidth,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    text: '${(expenseRatio * 100).toStringAsFixed(0)}%',
                    style: AppStyles.regular12.copyWith(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                );
              },
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomText(
                    text: totalIncomeLabel,
                    style: AppStyles.medium13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
