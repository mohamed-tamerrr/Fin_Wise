import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:fin_wise/features/home/widgets/custom_card.dart';

import 'package:fin_wise/features/home/widgets/top_row.dart';
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
          _buildTopSection(),
          // _buildTransactionsList(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildTopSection() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(60),
          ),
        ),
        child: Column(
          children: [
            Gap(30),
            CustomCard(), // savings / revenue
            Gap(10000),
            // _buildTabs(), // daily / weekly / monthly
          ],
        ),
      ),
    );
  }

  // SliverList _buildTransactionsList() {
  //   return SliverList(
  //     delegate: SliverChildBuilderDelegate((context, index) {
  //       return TransactionItem();
  //     }, childCount: 10),
  //   );
  // }
}
