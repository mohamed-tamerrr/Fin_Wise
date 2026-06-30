import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MoneyInfo extends StatelessWidget {
  const MoneyInfo({
    super.key,
    required this.title,
    required this.amount,
    required this.image,
    this.color,
  });
  final String title;
  final String amount;
  final String image;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Gap(5.h),
        CustomText(text: title, style: AppStyles.medium15),
        CustomText(
          text: amount,
          style: AppStyles.semiBold20.copyWith(color: color),
        ),
      ],
    );
  }
}
