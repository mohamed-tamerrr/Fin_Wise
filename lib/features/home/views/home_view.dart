import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:fin_wise/features/home/widgets/custom_card.dart';
import 'package:fin_wise/features/home/widgets/tabs.dart';
import 'package:fin_wise/features/home/widgets/top_row.dart';
import 'package:fin_wise/features/home/widgets/transaction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: CustomScrollView(
        slivers: [
          /// AppBar
          SliverAppBar(
            // toolbarHeight: 250,
            expandedHeight: 250,
            elevation: 0,
            scrolledUnderElevation: 0,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(
                  top: 28,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(40),
                    TopRow(),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: BalanceRow(
                        totalBalance: "\$7,783.00",
                        totalExp: "-\$1,187.40",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Body
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Gap(30),
                    CustomCard(),
                    Gap(26),
                    Tabs(),
                    // Gap(20),
                  ],
                ),
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
            child: Container(color: AppColors.backgroundColor),
          ),
        ],
      ),
    );
  }
}
