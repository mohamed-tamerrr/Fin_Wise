import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

import '../../../shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IncomeExpenseSelection extends StatefulWidget {
  const IncomeExpenseSelection({super.key});

  @override
  State<IncomeExpenseSelection> createState() =>
      _IncomeExpenseSelectionState();
}

class _IncomeExpenseSelectionState
    extends State<IncomeExpenseSelection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Handle income selection
              setState(() {
                selectedIndex = 1;
              });
            },
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(
                color: selectedIndex == 1
                    ? AppColors.oceanBlueButton
                    : AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Column(
                children: [
                  Gap(10.h),
                  Image.asset(
                    'assets/Income.png',
                    height: 30.h,
                    width: 30.w,
                    color: selectedIndex == 1
                        ? AppColors.backgroundColor
                        : AppColors.lettersandIcons,
                  ),
                  Gap(5.h),
                  CustomText(
                    text: 'Total Balance',
                    style: AppStyles.medium15.copyWith(
                      color: selectedIndex == 1
                          ? AppColors.backgroundColor
                          : AppColors.lettersandIcons,
                    ),
                  ),
                  CustomText(
                    text: '\$7,783.00',
                    style: AppStyles.semiBold20.copyWith(
                      color: selectedIndex == 1
                          ? AppColors.backgroundColor
                          : AppColors.lettersandIcons,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(15.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Handle expense selection
              setState(() {
                selectedIndex = 2;
              });
            },
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(
                color: selectedIndex == 2
                    ? AppColors.oceanBlueButton
                    : AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Column(
                children: [
                  Gap(10.h),
                  Image.asset(
                    'assets/Expenses.png',
                    height: 30.h,
                    width: 30.w,
                    color: selectedIndex == 2
                        ? AppColors.backgroundColor
                        : AppColors.lettersandIcons,
                  ),
                  Gap(5.h),
                  CustomText(
                    text: 'Total Balance',
                    style: AppStyles.medium15.copyWith(
                      color: selectedIndex == 2
                          ? AppColors.backgroundColor
                          : AppColors.lettersandIcons,
                    ),
                  ),
                  CustomText(
                    text: '\$7,783.00',
                    style: AppStyles.semiBold20.copyWith(
                      color: selectedIndex == 2
                          ? AppColors.backgroundColor
                          : AppColors.lettersandIcons,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
