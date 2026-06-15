import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Transaction extends StatelessWidget {
  final String title;
  final String time;
  final String type;
  final String amount;
  final String iconPath;
  final Color? amountColor;

  const Transaction({
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
                  fontSize: 15,
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
                const Gap(2),
                CustomText(
                  text: time,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  color: AppColors.expenses,
                ),
              ],
            ),
          ),

          // Divider
          VerticalDivider(
            color: AppColors.primary,
            thickness: 1,
            indent: 4,
            endIndent: 4,
          ),

          // Type
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomText(
              text: type,
              color: AppColors.secondaryTextColor,
              fontWeight: FontWeight.w300,
            ),
          ),

          /// Divider
          VerticalDivider(
            color: AppColors.primary,
            thickness: 1,
            indent: 4,
            endIndent: 4,
          ),
          const Gap(12),

          // Amount
          CustomText(
            text: amount,
            color: amountColor ?? AppColors.secondaryTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
