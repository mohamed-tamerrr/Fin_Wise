import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 20.h,
      ),
      width: double.infinity,

      constraints: BoxConstraints(minHeight: 152.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70.w,
                    height: 70.h,
                    child: CircularProgressIndicator(
                      value: 0.5,
                      strokeWidth: 3.w,
                      backgroundColor: AppColors.backgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.oceanBlueButton,
                      ),
                    ),
                  ),

                  Image.asset(
                    'assets/Car.png',
                    width: 40.w,
                    height: 40.h,
                  ),
                ],
              ),

              Gap(6.h),

              CustomText(
                text: 'Savings\nOn Goals',
                textAlign: TextAlign.center,
                style: AppStyles.medium12,
              ),
            ],
          ),

          Gap(20.w),

          SizedBox(
            height: 80.h,
            child: VerticalDivider(
              thickness: 2.w,
              color: AppColors.backgroundColor,
            ),
          ),

          Gap(20.w),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardStatRow(
                  iconPath: 'assets/Salary.png',
                  label: 'Revenue Last Week',
                  amount: '\$4,000.00',
                  amountColor: AppColors.secondaryTextColor,
                ),

                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Divider(
                    thickness: 2.h,
                    color: AppColors.backgroundColor,
                    height: 20.h,
                  ),
                ),

                CardStatRow(
                  iconPath: 'assets/Food.png',
                  label: 'Food Last Week',
                  amount: '-\$100.00',
                  amountColor: AppColors.oceanBlueButton,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardStatRow extends StatelessWidget {
  const CardStatRow({
    super.key,
    required this.iconPath,
    required this.label,
    required this.amount,
    required this.amountColor,
  });

  final String iconPath;
  final String label;
  final String amount;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: 28.w,
          height: 28.h,
          color: AppColors.secondaryTextColor,
        ),

        Gap(8.w),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: label,
              style: AppStyles.regular12.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),

            CustomText(
              text: amount,
              style: AppStyles.bold15.copyWith(
                color: amountColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
