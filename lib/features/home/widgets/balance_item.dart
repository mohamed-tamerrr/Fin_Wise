import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BalanceItem extends StatelessWidget {
  const BalanceItem({
    super.key,
    required this.amount,
    required this.title,
    this.amountColor,
    required this.icon,
  });

  final String amount, title;
  final Color? amountColor;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              icon,
              width: 12.w,
              height: 12.h,
              color: AppColors.secondaryTextColor,
            ),
            SizedBox(width: 6.w),
            CustomText(text: title, style: AppStyles.regular12),
          ],
        ),
        Gap(8.h),
        CustomText(
          text: amount,
          style: AppStyles.bold24.copyWith(color: amountColor),
        ),
      ],
    );
  }
}
