import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BalanceItem extends StatelessWidget {
  const BalanceItem({
    super.key,
    required this.amount,
    required this.title,
    this.amountColor,
  });

  final String amount, title;
  final Color? amountColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.arrow_outward, size: 16.sp),
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
