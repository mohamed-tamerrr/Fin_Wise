import '../../core/utils/app_colors.dart';
import 'custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.width,
    this.textColor,
    this.textStyle,
  });
  final String text;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final double? width;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          // vertical: 15,
        ),
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: CustomText(
            fontWeight: FontWeight.bold,
            text: text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
