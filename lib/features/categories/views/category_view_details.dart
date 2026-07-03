import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_router.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/categories/widgets/category_transactions.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:fin_wise/features/transactions/widgets/data_row.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_btn.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryViewDetails extends StatelessWidget {
  const CategoryViewDetails({super.key, required this.title});
  final String title;

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
                        text: title,
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
                      totalBalance: "\$7,783.00",
                      totalExp: "-\$1,187.40",
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
                    child: Column(
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
                    sliver: SliverList.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: CategoryTransactions(
                          iconPath: 'assets/Icon Salary.png',
                          title: 'Salary',
                          time: '18:27 - April 30',
                          type: 'Monthly',
                          amount: '-\$26,00',
                        ),
                      ),
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
                context.push(AppRouter.addExpenseView);
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
