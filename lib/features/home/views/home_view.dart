import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:fin_wise/features/home/widgets/custom_card.dart';
import 'package:fin_wise/features/home/widgets/home_tabs.dart';

import 'package:fin_wise/features/home/widgets/transaction.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: CustomScrollView(
        slivers: [
          /// AppBar
          CusomAppBar(
            topRow: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Hi, Welcome Back",
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: .2),
                  ),
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
          ),

          /// Body
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(
                left: 36,
                right: 36,
                top: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  const Gap(30),
                  const CustomCard(),
                  const Gap(26),
                  const HomeTabs(),
                  // Gap(20),
                ],
              ),
            ),
          ),

          /// Transctions
          DecoratedSliver(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(
                left: 36,
                right: 36,
                bottom: 36,
              ),
              sliver: SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Transaction(
                    iconPath: 'assets/Icon Salary.png',
                    title: 'Salary',
                    time: '18:27 - April 30',
                    type: 'Monthly',
                    amount: '\$4,000.00',
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: ColoredBox(color: AppColors.backgroundColor),
          ),
        ],
      ),
    );
  }
}
