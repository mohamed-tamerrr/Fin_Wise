import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_router.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/categories/data/models/category_model.dart';
import 'package:fin_wise/features/categories/widgets/category_transactions.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:fin_wise/features/transactions/cubit/transaction_cubit.dart';
import 'package:fin_wise/features/transactions/cubit/transaction_state.dart';
import 'package:fin_wise/features/transactions/widgets/data_row.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_btn.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
                  topRow: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 24.sp,
                        ),
                      ),

                      CustomText(
                        text: category.name,
                        style: AppStyles.semiBold20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(
                            alpha: .2,
                          ),
                        ),
                        child: Icon(
                          Icons.notifications,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: const BalanceRow(
                      totalBalance: '\$7,783.00',
                      totalExp: '-\$1,187.40',
                    ),
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
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
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
                    sliver:
                        BlocBuilder<
                          TransactionCubit,
                          TransactionState
                        >(
                          builder: (context, state) {
                            if (state is TransactionLoading) {
                              return const SliverToBoxAdapter(
                                child: Center(
                                  child:
                                      CircularProgressIndicator(),
                                ),
                              );
                            }

                            if (state is TransactionFailure) {
                              return SliverToBoxAdapter(
                                child: Center(
                                  child: Text(
                                    state.errorMessage,
                                  ),
                                ),
                              );
                            }

                            if (state is TransactionSuccess) {
                              final categoryTransactions =
                                  state.transactions
                                      .where(
                                        (t) =>
                                            t.categoryId ==
                                            category.id,
                                      )
                                      .toList()
                                    ..sort(
                                      (a, b) => b.date.compareTo(
                                        a.date,
                                      ),
                                    ); // most recent first

                              if (categoryTransactions.isEmpty) {
                                return const SliverToBoxAdapter(
                                  child: Center(
                                    child: Text(
                                      'No transactions yet',
                                    ),
                                  ),
                                );
                              }

                              return SliverList.builder(
                                itemCount:
                                    categoryTransactions.length,
                                itemBuilder: (context, index) {
                                  final transaction =
                                      categoryTransactions[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(
                                          bottom: 20,
                                        ),
                                    child: CategoryTransactions(
                                      iconName: category
                                          .iconName, // same category = same icon
                                      title: transaction.title,
                                      time: DateFormat(
                                        'HH:mm - MMMM d',
                                      ).format(transaction.date),
                                      type: category.name,
                                      amount:
                                          '-\$${transaction.amount.toStringAsFixed(2)}',
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

                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    color: AppColors.backgroundColor,
                  ),
                ),

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
