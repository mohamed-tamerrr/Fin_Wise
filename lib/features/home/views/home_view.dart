import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/color_filling.dart';
import '../../categories/widgets/category_view_details_failure.dart';
import '../../categories/widgets/category_view_details_loading.dart';
import '../../categories/widgets/no_transactions_widget.dart';
import '../../transactions/cubit/transaction_cubit.dart';
import '../../transactions/cubit/transaction_state.dart';
import '../widgets/balanced_row.dart';
import '../widgets/custom_card.dart';
import '../widgets/home_tabs.dart';
import '../widgets/transaction.dart';
import '../../../shared/custom_app_bar.dart';
import '../../../shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: CustomScrollView(
        slivers: [
          /// AppBar
          CustomAppBar(
            topRow: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Hi, Welcome Back',
                      style: AppStyles.semiBold20,
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: .2),
                  ),
                  child: Icon(Icons.notifications, size: 24.sp),
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

          /// Body
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
                children: [
                  Gap(30.h),
                  const CustomCard(),
                  Gap(26.h),
                  const HomeTabs(),
                ],
              ),
            ),
          ),

          /// Transctions
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
              sliver: BlocBuilder<TransactionCubit, TransactionState>(
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
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Transaction(
                          transaction: transactions[index].transaction,
                          category: transactions[index].category,
                        ),
                      ),
                    );
                  }

                  return const SliverToBoxAdapter(
                    child: SizedBox(),
                  );
                },
              ),
            ),
          ),
          const ColorFilling(),
        ],
      ),
    );
  }
}
