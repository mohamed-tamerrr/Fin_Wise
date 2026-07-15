import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/app_colors.dart';

class CategoryPreviewCard extends StatelessWidget {
  const CategoryPreviewCard({
    super.key,
    required this.iconData,
    required this.color,
    required this.name,
  });
  final IconData iconData;
  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    final displayName = name.trim();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color.fromARGB(255, 67, 67, 99)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.10),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Preview',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFA0A0AA),
              letterSpacing: 0.6,
            ),
          ),
          Gap(16.h),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              color: color.withValues(alpha: .12),
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: color, size: 28.sp),
          ),
          Gap(12.h),
          Text(
            displayName.isEmpty ? 'Category name' : displayName,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: displayName.isEmpty ? const Color(0xFFC4C4CC) : const Color(0xFF1A1A1E),
            ),
          ),
        ],
      ),
    );
  }
}
