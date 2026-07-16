// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../core/helpers/icon_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/widgets/custom_text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.iconName,
    required this.title,
    required this.onTap,
  });

  final String iconName;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.oceanBlueButton,
                // color: Colors.red,
                borderRadius: BorderRadius.circular(20.r),
              ),

              /// Image
              child: Icon(
                IconMapper.getIcon(iconName),
                color: AppColors.backgroundColor,
                size: 36.w,
              ),
            ),
          ),
          Gap(6.h),
          CustomText(
            text: title,
            style: AppStyles.medium15.copyWith(
              color: AppColors.lettersandIcons,
            ),
          ),
        ],
      ),
    );
  }
}
