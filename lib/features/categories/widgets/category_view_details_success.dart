import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widgets/transaction_dismissible.dart';
import '../../transactions/cubit/transaction_cubit.dart';
import '../../transactions/data/models/transaction_details_model.dart';
import '../../transactions/data/models/transaction_model.dart';
import '../data/models/category_model.dart';
import 'category_transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryViewDetailsSuccess extends StatelessWidget {
  const CategoryViewDetailsSuccess({
    super.key,
    required this.transactions,
    required this.category,
  });

  final List<TransactionDetailsModel> transactions;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final item = transactions[index];
        final transaction = item.transaction;
        final category = item.category;

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TransactionDismissible(
            transaction: transaction,
            child: CategoryTransactions(
              iconName: category!.iconName,
              title: transaction.title,
              time: DateFormat(
                'HH:mm - MMMM d',
              ).format(transaction.date),
              type: category.name,
              amount: '-\$${transaction.amount.toStringAsFixed(2)}',
            ),
          ),
        );
      },
    );
  }
}
