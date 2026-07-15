import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../data/models/category_model.dart';
import 'type_option_tile.dart';

class TypeToggle extends StatelessWidget {
  const TypeToggle({
    super.key,
    required this.selectedType,
    required this.onChanged,
    required this.color,
  });
  final CategoryType selectedType;
  final ValueChanged<CategoryType> onChanged;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TypeOptionTile(
              type: CategoryType.expense,
              label: 'Expense',
              isSelected: selectedType == CategoryType.expense,
              onTap: () => onChanged(CategoryType.expense),
            ),
          ),
          Expanded(
            child: TypeOptionTile(
              type: CategoryType.income,
              label: 'Income',
              isSelected: selectedType == CategoryType.income,
              onTap: () => onChanged(CategoryType.income),
            ),
          ),
        ],
      ),
    );
  }
}
