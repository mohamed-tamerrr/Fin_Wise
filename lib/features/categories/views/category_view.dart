import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_router.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/categories/data/models/category_view_model.dart';
import 'package:fin_wise/features/categories/widgets/category_card.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});
  static const List<CategoryModel> categories = [
    CategoryModel(
      name: 'Food',
      image: 'assets/categories/food.png',
    ),
    CategoryModel(
      name: 'Transport',
      image: 'assets/categories/transport.png',
    ),
    CategoryModel(
      name: 'Medicine',
      image: 'assets/categories/medi.png',
    ),
    CategoryModel(
      name: 'Groceries',
      image: 'assets/categories/groc.png',
    ),
    CategoryModel(
      name: 'Rent',
      image: 'assets/categories/rent.png',
    ),
    CategoryModel(
      name: 'Gifts',
      image: 'assets/categories/gifts.png',
    ),
    CategoryModel(
      name: 'Savings',
      image: 'assets/categories/savings.png',
    ),
    CategoryModel(
      name: 'Entertainment',
      image: 'assets/categories/enter.png',
    ),
    CategoryModel(
      name: 'More',
      image: 'assets/categories/more.png',
    ),
  ];

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
                      text: "Categories",
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
                totalBalance: "\$7,783.00",
                totalExp: "-\$1,187.40",
              ),
            ),
          ),

          /// Body
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
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
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: categories.length,
                shrinkWrap: true,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 24.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 0.79,
                    ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryCard(
                    image: category.image,
                    title: category.name,
                    onTap: () => context.push(
                      AppRouter.categoryViewDetails,
                      extra: category.name,
                    ),
                  );
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
