import 'package:flutter/material.dart';

class BalanceItem extends StatelessWidget {
  const BalanceItem({
    super.key,
    required this.amount,
    required this.title,
    this.amountColor,
  });
  final String amount, title;
  final Color? amountColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.arrow_outward, size: 16),
            SizedBox(width: 6),
            Text(title),
          ],
        ),
        SizedBox(height: 8),
        Text(
          amount,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: amountColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
