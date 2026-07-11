import 'package:flutter/material.dart';

class TransactionsLoadingWidget extends StatelessWidget {
  const TransactionsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
