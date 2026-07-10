import 'package:flutter/material.dart';

class CategoryViewDetailsLoading extends StatelessWidget {
  const CategoryViewDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
