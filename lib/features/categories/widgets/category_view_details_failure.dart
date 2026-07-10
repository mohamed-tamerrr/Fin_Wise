import 'package:flutter/material.dart';

class CategoryViewDetailsFailure extends StatelessWidget {
  const CategoryViewDetailsFailure({
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
