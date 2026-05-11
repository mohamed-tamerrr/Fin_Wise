import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int count;
  final int current;
  final Color activeColor;

  const DotsIndicator({
    super.key,
    required this.count,
    required this.current,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? activeColor : Colors.grey.shade300,
          ),
        );
      }),
    );
  }
}
