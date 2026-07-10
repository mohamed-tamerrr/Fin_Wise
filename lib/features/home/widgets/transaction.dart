import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Transaction extends StatelessWidget {
  const Transaction({
    super.key,
    required this.title,
    required this.time,
    required this.type,
    required this.amount,
    required this.iconPath,
    this.amountColor,
  });
  final String title;
  final String time;
  final String type;
  final String amount;
  final String iconPath;
  final Color? amountColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              style: AppStyles.light13,
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
          CustomText(text: amount, style: AppStyles.medium15),
        ],
      ),
    );
  }
}
