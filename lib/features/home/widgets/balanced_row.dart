import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/home/widgets/balance_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BalanceRow extends StatelessWidget {
  const BalanceRow({
    super.key,
    required this.totalBalance,
    required this.totalExp,
  });
  final String totalBalance, totalExp;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BalanceItem(
                title: "Total Balance",
                amount: totalBalance,
                amountColor: AppColors.backgroundColor,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                height: 50,
                child: VerticalDivider(
                  width: 1,
                  color: AppColors.secondary,
                ),
              ),
            ),

            Expanded(
              child: BalanceItem(
                title: "Total Expense",
                amount: totalExp,
                amountColor: AppColors.expenses,
              ),
            ),
          ],
        ),
        const Gap(20),
        Column(
          children: [
            Stack(
              children: [
                // background
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),

                // progress
                Container(
                  height: 40,
                  width:
                      120, // control percentage manually or dynamically
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "30%",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // right text
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text("\$20,000.00"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
