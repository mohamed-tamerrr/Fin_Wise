import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/analysis/widgets/icon_button.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';

class DateRow extends StatelessWidget {
  const DateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: 'April', style: AppStyles.medium15),
        const CustomIconButton(
          icon: Icons.calendar_month_outlined,
        ),
      ],
    );
  }
}
