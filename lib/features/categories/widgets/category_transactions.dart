import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryTransactions extends StatelessWidget {
  final String title;
  final String time;
  final String type;
  final String amount;
  final String iconPath;
  final Color? amountColor;

  const CategoryTransactions({
    super.key,
    required this.title,
    required this.time,
    required this.type,
    required this.amount,
    required this.iconPath,
    this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Icon
          Image.asset(
            iconPath,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          const Gap(16),

          // Title + Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: title,
                  style: AppStyles.medium15,
                ),
                const Gap(2),
                CustomText(
                  text: time,
                  style: AppStyles.semiBold12,
                ),
              ],
            ),
          ),

          Spacer(),

          // expenses
          CustomText(
            text: amount,
            style: AppStyles.medium15.copyWith(
              color: AppColors.oceanBlueButton,
            ),
          ),
        ],
      ),
    );
  }
}
