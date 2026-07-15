import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class SaveBar extends StatelessWidget {
  final bool isEnabled;
  final Color color;
  final VoidCallback onSave;
  final String label;

  const SaveBar({
    super.key,
    required this.isEnabled,
    required this.color,
    required this.onSave,
    this.label = 'Save category',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(top: BorderSide(color: Color(0xFFEFEFF4))),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: isEnabled ? onSave : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            disabledBackgroundColor: const Color(0xFFE8E8EE),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: isEnabled ? Colors.white : const Color(0xFFB0B0B8),
            ),
          ),
        ),
      ),
    );
  }
}
