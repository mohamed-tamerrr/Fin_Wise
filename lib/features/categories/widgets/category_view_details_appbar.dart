import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_styles.dart';
import '../../../shared/widgets/custom_text.dart';
import '../data/models/category_model.dart';

class CategoryViewDetailsAppBar extends StatelessWidget {
  const CategoryViewDetailsAppBar({
    super.key,
    required this.category,
    required this.onTap,
  });

  final CategoryModel category;
  final Future<void> Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.sp,
          ),
        ),
        CustomText(
          text: category.name,
          style: AppStyles.semiBold20,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: .2),
            ),
            child: Icon(
              Icons.delete_outline,
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
