import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../shared/widgets/custom_text.dart';

class AddCategoryAppBar extends StatelessWidget {
  const AddCategoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          color: const Color(0xFF1A1A1E),
        ),
        Gap(4.w),
        CustomText(
          text: 'New category',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A1A1E),
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}
