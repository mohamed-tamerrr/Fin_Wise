import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/home/widgets/balance_item.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BalanceRow extends StatelessWidget {
  const BalanceRow({
    super.key,
    required this.totalBalance,
    required this.totalExp,
  });

  final String totalBalance, totalExp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BalanceItem(
                title: "Total Balance",
                amount: totalBalance,
                amountColor: AppColors.backgroundColor,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 50.h,
                child: VerticalDivider(
                  width: 1.w,
                  color: AppColors.secondary,
                ),
              ),
            ),

            Expanded(
              child: BalanceItem(
                title: "Total Expense",
                amount: totalExp,
                amountColor: AppColors.oceanBlueButton,
              ),
            ),
          ],
        ),

        Gap(20.h),

        Stack(
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),

            Container(
              constraints: BoxConstraints(minHeight: 40.h),
              width: 120.w,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25.r),
              ),
              alignment: Alignment.center,
              child: CustomText(
                text: "30%",
                style: AppStyles.regular12.copyWith(
                  color: AppColors.backgroundColor,
                ),
              ),
            ),

            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: CustomText(
                    text: "\$20,000.00",
                    style: AppStyles.medium13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
