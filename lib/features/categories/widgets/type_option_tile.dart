import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/models/category_model.dart';

class TypeOptionTile extends StatelessWidget {
  const TypeOptionTile({
    super.key,
    required this.type,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  final CategoryType type;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  Color get _accentColor => type == CategoryType.expense ? const Color(0xFFEF6C5B) : const Color(0xFF2FBF88);

  IconData get _icon => type == CategoryType.expense ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _icon,
              size: 16.sp,
              color: isSelected ? _accentColor : Colors.white,
            ),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: isSelected ? const Color(0xFF1A1A1E) : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
