import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 20,
      ),
      width: double.infinity,
      height: 152,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // Left side - circular progress + label
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      value: 0.5,
                      strokeWidth: 3,
                      backgroundColor: AppColors.backgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.expenses,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Car.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              const Gap(6),
              CustomText(
                text: 'Savings\nOn Goals',
                textAlign: TextAlign.center,
                color: AppColors.secondaryTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),

          const Gap(20),

          // Divider
          Container(width: 2, color: AppColors.backgroundColor),

          const Gap(20),

          // Right side - revenue + food
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Revenue row
                CardStatRow(
                  iconPath: 'assets/Salary.png',
                  label: 'Revenue Last Week',
                  amount: '\$4,000.00',
                  amountColor: AppColors.secondaryTextColor,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                    color: AppColors.backgroundColor,
                    height: 20,
                  ),
                ),

                // Food row
                CardStatRow(
                  iconPath: 'assets/Food.png',
                  label: 'Food Last Week',
                  amount: '-\$100.00',
                  amountColor: AppColors.expenses,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardStatRow extends StatelessWidget {
  const CardStatRow({
    required this.iconPath,
    required this.label,
    required this.amount,
    required this.amountColor,
  });
  final String iconPath;
  final String label;
  final String amount;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: 28,
          height: 28,
          color: AppColors.secondaryTextColor,
        ),
        const Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 11,
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                color: amountColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
