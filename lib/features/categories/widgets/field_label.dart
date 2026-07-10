import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/custom_text.dart';
import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: label,
      style: AppStyles.medium15.copyWith(
        color: AppColors.lettersandIcons,
      ),
    );
  }
}
