import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/color_filling.dart';
import '../data/models/category_model.dart';
import '../widgets/category_view_details_appbar.dart';
import '../widgets/category_view_details_failure.dart';
import '../widgets/category_view_details_loading.dart';
import '../widgets/category_view_details_success.dart';
import '../../home/widgets/balanced_row.dart';
import '../../transactions/cubit/transaction_cubit.dart';
import '../../transactions/cubit/transaction_state.dart';
import '../../transactions/widgets/data_row.dart';
import '../../../shared/custom_app_bar.dart';
import '../../../shared/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/no_transactions_widget.dart';

class CategoryViewDetails extends StatelessWidget {
  const CategoryViewDetails({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColoredBox(
            color: AppColors.primary,
            child: CustomScrollView(
              
              slivers: [
                CustomAppBar(
                  topRow: TopAppBar(title: category.name),
                  body: Padding(
                    padding: .symmetric(horizontal: 20.w),
                    child: const BalanceRow(
                      totalBalance: '\$7,783.00',
                      totalExp: '-\$1,187.40',
                    ),
                  ),
                ),

                /// Date and Calendar
                SliverToBoxAdapter(
                  child: Container(
                    padding: .only(
                      left: 36.w,
                      right: 36.w,
                      top: 16.h,
                      bottom: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: .vertical(
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
                    padding: const .only(
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
                          final categoryTransactions = state.transactions;

                          if (categoryTransactions.isEmpty) {
                            return const NoTransActionsWidget();
                          }

                          return CategoryViewDetailsSuccess(
                            category: category,
                            transactions: categoryTransactions,
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

                SliverToBoxAdapter(
                  child: Container(
                    color: AppColors.backgroundColor,
                    height: 50.h,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 36.w,
            right: 36.w,
            bottom: 24.h,
            child: CustomButton(
              onTap: () {
                context.push(
                  AppRouter.addExpenseView,
                  extra: category,
                );
              },
              text: 'Add Expenses',
              textStyle: AppStyles.medium15.copyWith(
                color: AppColors.lettersandIcons,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
