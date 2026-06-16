import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CusomAppBar extends StatelessWidget {
  const CusomAppBar({super.key, this.topRow});
  final Widget? topRow;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
              topRow ?? SizedBox.shrink(),

              const Gap(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: BalanceRow(
                  totalBalance: "\$7,783.00",
                  totalExp: "-\$1,187.40",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
