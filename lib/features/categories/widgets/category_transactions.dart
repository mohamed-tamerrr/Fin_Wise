import '../../../core/helpers/icon_mapper.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryTransactions extends StatelessWidget {
  const CategoryTransactions({
    super.key,
    required this.title,
    required this.time,
    required this.type,
    required this.amount,
    required this.iconName,
    this.amountColor,
  });
  final String title;
  final String time;
  final String type;
  final String amount;
  final String iconName;
  final Color? amountColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Icon
          Icon(IconMapper.getIcon(iconName)),
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

          const Spacer(),

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
