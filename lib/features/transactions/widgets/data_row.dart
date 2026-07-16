import '../../../core/utils/app_styles.dart';
import '../../analysis/widgets/icon_button.dart';
import '../../../shared/widgets/custom_text.dart';
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
