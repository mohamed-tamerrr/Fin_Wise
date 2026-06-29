import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CusomAppBar extends StatelessWidget {
  const CusomAppBar({super.key, this.topRow});

  final Widget? topRow;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.h,
      elevation: 0,
      scrolledUnderElevation: 0,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(
            top: 28.h,
            left: 30.w,
            right: 30.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(40.h),

              topRow ?? const SizedBox.shrink(),

              Gap(20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const BalanceRow(
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
