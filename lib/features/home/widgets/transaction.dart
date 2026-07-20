import 'package:intl/intl.dart';

import '../../../core/helpers/icon_mapper.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../categories/data/models/category_model.dart';
import '../../transactions/data/models/transaction_model.dart';

class Transaction extends StatelessWidget {
  const Transaction({
    super.key,
    required this.transaction,
    required this.category,
  });

  final TransactionModel transaction;
  final CategoryModel? category; // nullable in case category was deleted

  String _foramttedAmout() {
    final isIncome = category?.type == CategoryType.income;
    final amount = transaction.amount.toStringAsFixed(2);
    return isIncome ? '\$$amount' : '-\$$amount';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Icon(IconMapper.getIcon(category?.iconName ?? 'default')),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: transaction.title, style: AppStyles.medium15),
                const Gap(2),
                CustomText(
                  text: DateFormat('HH:mm - MMMM d').format(transaction.date),
                  style: AppStyles.semiBold12,
                ),
              ],
            ),
          ),
          VerticalDivider(color: AppColors.primary, thickness: 1, indent: 4, endIndent: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomText(
              text: category?.name ?? 'Unknown',
              style: AppStyles.light13,
            ),
          ),
          VerticalDivider(color: AppColors.primary, thickness: 1, indent: 4, endIndent: 4),
          const Gap(12),
          CustomText(
            text: _foramttedAmout(),
            style: AppStyles.medium15,
          ),
        ],
      ),
    );
  }
}
