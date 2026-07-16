import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class ColorFilling extends StatelessWidget {
  const ColorFilling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        color: AppColors.backgroundColor,
      ),
    );
  }
}
