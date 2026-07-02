import 'package:fin_wise/core/utils/app_styles.dart';
import 'package:fin_wise/features/home/widgets/balanced_row.dart';
import 'package:fin_wise/shared/custom_app_bar.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryViewDetails extends StatelessWidget {
  const CategoryViewDetails({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CusomAppBar(
          topRow: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    style: AppStyles.semiBold20,
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: .2),
                ),
                child: Icon(Icons.notifications, size: 24.sp),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const BalanceRow(
              totalBalance: "\$7,783.00",
              totalExp: "-\$1,187.40",
            ),
          ),
        ),
      ],
    );
  }
}
