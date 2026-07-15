import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/color_filling.dart';
import '../../../shared/custom_text.dart';
import '../cubit/category_cubit.dart';
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

  Future<void> confirmDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withValues(alpha: .1),
                ),
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 32.sp,
                ),
              ),
              SizedBox(height: 16.h),
              CustomText(
                text: 'Delete Category',
                style: AppStyles.semiBold20,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: 'Are you sure you want to delete "${category.name}"? This action cannot be undone.',
                style: AppStyles.medium15.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(false),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: CustomText(
                        text: 'Cancel',
                        style: AppStyles.medium15,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: CustomText(
                        text: 'Delete',
                        style: AppStyles.medium15.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    if (confirmed == true && context.mounted) {
      await context.read<CategoryCubit>().deleteCategory(category.id);
      if (context.mounted) context.pop();
    }
  }

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
                  topRow: CategoryViewDetailsAppBar(
                    category: category,
                    onTap: () => confirmDelete(context),
                  ),
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
