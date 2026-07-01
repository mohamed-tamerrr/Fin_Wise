import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CusomAppBar extends StatelessWidget {
  const CusomAppBar({
    super.key,
    this.topRow,
    this.body,
    this.expandedHeight,
  });

  final Widget? topRow;
  final Widget? body;
  final double? expandedHeight;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight ?? 250.h,
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

              body ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
