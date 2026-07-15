import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryNameField extends StatelessWidget {
  const CategoryNameField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.selectedColor,
    required this.onChanged,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final Color selectedColor;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: focusNode,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: focusNode.hasFocus ? selectedColor : const Color(0xFFEFEFF4),
              width: focusNode.hasFocus ? 1.5 : 1,
            ),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onTapOutside: (_) => focusNode.unfocus(),
            onChanged: onChanged,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: 'e.g. Groceries',
              hintStyle: TextStyle(
                color: const Color(0xFFC4C4CC),
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            ),
          ),
        );
      },
    );
  }
}
