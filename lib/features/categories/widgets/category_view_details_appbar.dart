import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_styles.dart';
import '../../../shared/custom_text.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.sp,
          ),
        ),

        CustomText(
          text: title,
          style: AppStyles.semiBold20,
        ),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(
              alpha: .2,
            ),
          ),
          child: Icon(
            Icons.notifications,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
