import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

import '../../../shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../categories/data/models/category_model.dart';

import '../cubit/filtered_tranactions_cubit.dart';
import '../cubit/transaction_state.dart';

class IncomeExpenseSelection extends StatelessWidget {
  const IncomeExpenseSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsFilterCubit, TransactionState>(
      builder: (context, state) {
        final filter = context.read<TransactionsFilterCubit>().typeFilter;
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<TransactionsFilterCubit>().setTypeFilter(CategoryType.income);
                },
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: filter == CategoryType.income ? AppColors.oceanBlueButton : AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Column(
                    children: [
                      Gap(10.h),
                      Image.asset(
                        'assets/Income.png',
                        height: 30.h,
                        width: 30.w,
                        color: filter == CategoryType.income ? AppColors.backgroundColor : AppColors.lettersandIcons,
                      ),
                      Gap(5.h),
                      CustomText(
                        text: 'Income',
                        style: AppStyles.medium15.copyWith(
                          color: filter == CategoryType.income ? AppColors.backgroundColor : AppColors.lettersandIcons,
                        ),
                      ),
                      CustomText(
                        text: '\$7,783.00',
                        style: AppStyles.semiBold20.copyWith(
                          color: filter == CategoryType.income ? AppColors.backgroundColor : AppColors.lettersandIcons,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(15.w),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<TransactionsFilterCubit>().setTypeFilter(CategoryType.expense);
                },
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: filter == CategoryType.expense ? AppColors.oceanBlueButton : AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Column(
                    children: [
                      Gap(10.h),
                      Image.asset(
                        'assets/Expenses.png',
                        height: 30.h,
                        width: 30.w,
                        color: filter == CategoryType.expense ? AppColors.backgroundColor : AppColors.lettersandIcons,
                      ),
                      Gap(5.h),
                      CustomText(
                        text: 'Expense',
                        style: AppStyles.medium15.copyWith(
                          color: filter == CategoryType.expense ? AppColors.backgroundColor : AppColors.lettersandIcons,
                        ),
                      ),
                      CustomText(
                        text: '\$7,783.00',
                        style: AppStyles.semiBold20.copyWith(
                          color: filter == CategoryType.expense ? AppColors.backgroundColor : AppColors.lettersandIcons,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
