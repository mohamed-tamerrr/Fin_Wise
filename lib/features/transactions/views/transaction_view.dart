import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/analysis/widgets/icon_button.dart';
import 'package:fin_wise/features/home/widgets/transaction.dart';
import 'package:fin_wise/features/transactions/widgets/data_row.dart';
import 'package:fin_wise/features/transactions/widgets/income_expense_selection.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: CustomScrollView(
        slivers: [
          CustomAppBar(
            expandedHeight: 300.h,
            topRow: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Transaction',
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
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
            body: Column(
              children: [
                Container(
                  height: 75.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: AppColors.backgroundColor,
                  ),
                  child: Column(
                    children: [
                      Gap(10.h),
                      CustomText(
                        text: 'Total Balance',
                        style: AppStyles.medium15.copyWith(
                          color: AppColors.lettersandIcons,
                        ),
                      ),
                      CustomText(
                        text: '\$7,783.00',
                        style: AppStyles.bold24.copyWith(
                          color: AppColors.lettersandIcons,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(15.h),
                IncomeExpenseSelection(),
              ],
            ),
          ),

          /// Date and Calendar
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
                children: [DateRow()],
              ),
            ),
          ),

          /// Transactions
          DecoratedSliver(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(
                left: 36,
                right: 36,
                bottom: 36,
              ),
              sliver: SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Transaction(
                    iconPath: 'assets/Icon Salary.png',
                    title: 'Salary',
                    time: '18:27 - April 30',
                    type: 'Monthly',
                    amount: '\$4,000.00',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
