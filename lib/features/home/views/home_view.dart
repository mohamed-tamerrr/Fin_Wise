import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/home/widgets/custom_card.dart';
import 'package:fin_wise/features/home/widgets/home_tabs.dart';
import 'package:fin_wise/features/home/widgets/transaction.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_text.dart';
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
          CusomAppBar(
            topRow: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Hi, Welcome Back",
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
          ),

          /// Body
          // todo : Start styles here
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
              sliver: SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Transaction(
                    iconPath: 'assets/Icon Salary.png',
                    title: 'Salary',
                    time: '18:27 - April 30',
                    type: 'Monthly',
                    amount: '\$4,000.00',
                  ),
                ),
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
