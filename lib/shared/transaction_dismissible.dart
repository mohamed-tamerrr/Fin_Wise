import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/transactions/cubit/transaction_cubit.dart';
import '../features/transactions/data/models/transaction_model.dart';

class TransactionDismissible extends StatelessWidget {
  const TransactionDismissible({
    super.key,
    required this.transaction,
    required this.child,
  });

  final TransactionModel transaction;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(transaction.id),
      direction: DismissDirection.endToStart,

      background: Container(
        color: Colors.red,
      ),

      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 28,
        ),
      ),

      onDismissed: (_) {
        context.read<TransactionCubit>().deleteTransaction(transaction.id);
      },

      child: child,
    );
  }
}
