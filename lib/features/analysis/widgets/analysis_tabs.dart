import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisTabs extends StatefulWidget {
  const AnalysisTabs({super.key});

  @override
  State<AnalysisTabs> createState() => _AnalysisTabsState();
}

class _AnalysisTabsState extends State<AnalysisTabs> {
  final tabs = ['Daily', 'Weekly', 'Monthly', 'Year'];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  decoration: BoxDecoration(
                    color: selected == index
                        ? AppColors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    text: tabs[index],
                    style: AppStyles.regular15,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
