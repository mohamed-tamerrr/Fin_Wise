import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TargetItem extends StatelessWidget {
  const TargetItem({
    super.key,
    required this.title,
    this.value,
    required this.percentage,
  });
  final String title;
  final double? value;
  final String percentage;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: AppColors.lightBlueButton,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                SizedBox(
                  width: 90.w,
                  height: 90.h,
                  child: CircularProgressIndicator(
                    value: value,
                    color: AppColors.oceanBlueButton,
                    backgroundColor: AppColors.backgroundColor,
                    strokeWidth: 4,
                  ),
                ),
                CustomText(
                  text: percentage,
                  style: AppStyles.semiBold20.copyWith(
                    color: AppColors.backgroundColor,
                  ),
                ),
              ],
            ),
            Gap(5.h),
            CustomText(
              text: title,
              style: AppStyles.medium15.copyWith(
                color: AppColors.backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
