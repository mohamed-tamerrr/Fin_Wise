import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/icon_mapper.dart';
import '../views/add_category.dart';

class IconGrid extends StatelessWidget {
  const IconGrid({
    super.key,
    required this.icons,
    required this.selectedKey,
    required this.selectedColor,
    required this.onSelect,
  });
  final List<IconOption> icons;
  final String? selectedKey;
  final Color selectedColor;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final option = icons[index];
        final isSelected = option.key == selectedKey;
        return GestureDetector(
          onTap: () => onSelect(option.key),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: isSelected ? selectedColor.withValues(alpha: 0.12) : Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected ? selectedColor : const Color(0xFFEFEFF4),
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconMapper.getIcon(option.key),
                  size: 20.sp,
                  color: isSelected ? selectedColor : const Color(0xFF9A9AA4),
                ),
                SizedBox(height: 4.h),
                Text(
                  option.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? selectedColor : const Color(0xFF9A9AA4),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
