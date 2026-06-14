import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final tabs = ["Daily", "Weekly", "Monthly"];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: selected == index
                        ? AppColors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    text: tabs[index],
                    fontSize: 15,
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
