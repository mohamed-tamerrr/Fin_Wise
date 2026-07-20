import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/summary/cubit/summary_cubit.dart';
import '../cubit/category_cubit.dart';
import '../data/models/category_model.dart';
import '../widgets/category_card.dart';
import '../../home/widgets/balanced_row.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: CustomScrollView(
        slivers: [
          /// AppBar
          CustomAppBar(
            topRow: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    CustomText(
                      text: 'Categories',
                      style: AppStyles.semiBold20,
                    ),
                  ],
                ),

                Container(
                  padding: .all(10.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: .2),
                  ),
                  child: Icon(Icons.notifications, size: 24.sp),
                ),
              ],
            ),
            body: Padding(
              padding: .symmetric(horizontal: 20.w),
              child: BlocBuilder<SummaryCubit, SummaryState>(
                builder: (context, state) {
                  if (state is SummarySuccess) {
                    final summary = state.summary;
                    return BalanceRow(
                      totalBalance: summary.formattedBalance,
                      totalExp: summary.formattedExpense,
                      expenseRatio: summary.expenseRatio,
                      totalIncomeLabel: summary.formattedIncome,
                    );
                  }
                  return const BalanceRow(
                    totalBalance: '\$7,783.00',
                    totalExp: '-\$1,187.40',
                    expenseRatio: 0.30,
                    totalIncomeLabel: '\$20,000.00',
                  );
                },
              ),
            ),
          ),

          /// Body
          SliverToBoxAdapter(
            child: Container(
              padding: .only(
                left: 36.w,
                right: 36.w,
                bottom: 16.h,
                top: 33.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(60.r),
                ),
              ),
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is CategorySuccess) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: state.categories.length + 1,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 24.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: 0.79,
                      ),
                      itemBuilder: (context, index) {
                        if (index == state.categories.length) {
                          // last cell -> "Add Category" card
                          return CategoryCard(
                            iconName: '',
                            title: 'Add Category',
                            onTap: () {
                              context.push(AppRouter.addCategory);
                            },
                          );
                        }

                        final category = state.categories[index];
                        return CategoryCard(
                          iconName: category.iconName,
                          title: category.name,
                          onTap: () {
                            context.push(
                              AppRouter.categoryViewDetails,
                              extra: category,
                            );
                          },
                        );
                      },
                    );
                  }

                  if (state is CategoryFailure) {
                    return Text(state.errorMessage);
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),

          SliverFillRemaining(
            hasScrollBody: false,
            child: ColoredBox(color: AppColors.backgroundColor),
          ),
        ],
      ),
    );
  }
}
