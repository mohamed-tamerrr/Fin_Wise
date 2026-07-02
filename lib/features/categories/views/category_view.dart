import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_router.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/categories/widgets/category_card.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';

import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  static List<Map<String, String>> categories = [
    {"Food": 'assets/categories/food.png'},
    {"Transport": 'assets/categories/transport.png'},
    {"Medicine": 'assets/categories/medi.png'},
    {"Groceries": 'assets/categories/groc.png'},
    {"Rent": 'assets/categories/rent.png'},
    {"Gifts": 'assets/categories/gifts.png'},
    {"Savings": 'assets/categories/savings.png'},
    {"Entertainment": 'assets/categories/enter.png'},
    {"More": 'assets/categories/more.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: CustomScrollView(
        slivers: [
          /// AppBar
          CusomAppBar(
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
                  final title = categories[index].keys.first;
                  final image = categories[index].values.first;
                  return CategoryCard(
                    image: image,
                    title: title,
                    onTap: () => context.push(
                      AppRouter.categoryViewDetails,
                      extra: title,
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
