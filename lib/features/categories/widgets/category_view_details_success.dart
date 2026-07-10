import '../data/models/category_model.dart';
import 'category_transactions.dart';
import '../../transactions/data/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryViewDetailsSuccess extends StatelessWidget {
  const CategoryViewDetailsSuccess({
    super.key,
    required this.categoryTransactions,
    required this.category,
  });

  final List<TransactionModel> categoryTransactions;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: categoryTransactions.length,
      itemBuilder: (context, index) {
        final transaction = categoryTransactions[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CategoryTransactions(
            iconName:
                category.iconName, // same category = same icon
            title: transaction.title,
            time: DateFormat(
              'HH:mm - MMMM d',
            ).format(transaction.date),
            type: category.name,
            amount:
                '-\$${transaction.amount.toStringAsFixed(2)}',
          ),
        );
      },
    );
  }
}
