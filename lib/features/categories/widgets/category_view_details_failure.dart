import 'package:flutter/material.dart';

class TransactionsFailureWidget extends StatelessWidget {
  const TransactionsFailureWidget({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(child: Text(message)),
    );
  }
}
