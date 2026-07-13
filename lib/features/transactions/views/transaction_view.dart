import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

import '../../../shared/transaction_dismissible.dart';
import '../../categories/widgets/category_view_details_failure.dart';
import '../../categories/widgets/category_view_details_loading.dart';
import '../../categories/widgets/no_transactions_widget.dart';
import '../../home/widgets/transaction.dart';
import '../cubit/filtered_tranactions_cubit.dart';

import '../cubit/transaction_cubit.dart';
import '../cubit/transaction_state.dart';
import '../data/repo/transaction_repo.dart';
import '../widgets/data_row.dart';
import '../widgets/income_expense_selection.dart';
import '../../../shared/custom_app_bar.dart';
import '../../../shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionsFilterCubit(context.read<TransactionRepo>())..watchAll(),
      child: ColoredBox(
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
                    child: const Icon(Icons.notifications),
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
                  const IncomeExpenseSelection(),
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
                child: const Column(
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
                sliver: BlocBuilder<TransactionsFilterCubit, TransactionState>(
                  builder: (context, state) {
                    if (state is TransactionLoading) {
                      return const TransactionsLoadingWidget();
                    }

                    if (state is TransactionFailure) {
                      return TransactionsFailureWidget(
                        message: state.errorMessage,
                      );
                    }

                    if (state is TransactionSuccess) {
                      final transactions = state.transactions;

                      if (transactions.isEmpty) {
                        return const NoTransActionsWidget();
                      }

                      return SliverList.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final item = transactions[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TransactionDismissible(
                              transaction: item.transaction,
                              child: Transaction(
                                transaction: item.transaction,
                                category: item.category,
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return const SliverToBoxAdapter(
                      child: SizedBox(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
