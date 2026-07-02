import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/analysis/views/analysis_view.dart';
import 'package:fin_wise/features/categories/views/category_view.dart';
import 'package:fin_wise/features/home/views/home_view.dart';
import 'package:fin_wise/features/profile/views/profile_view.dart';
import 'package:fin_wise/features/transactions/views/transaction_view.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final List<Widget> screens = [
    HomeView(),
    AnalysisView(),
    TransactionView(),
    CategoryView(),
    ProfileView(),
  ];

  late PageController controller;
  int currentScreen = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentScreen);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onTabTap(int index) {
    setState(() => currentScreen = index);
    controller.jumpToPage(
      index,
    ); // use jumpToPage for instant switch
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: PageView(
        controller: controller,
        physics:
            const NeverScrollableScrollPhysics(), // disable swipe
        children: screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24,
        ),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icon: Icons.home_outlined,
                index: 0,
                current: currentScreen,
                onTap: _onTabTap,
              ),
              NavItem(
                icon: Icons.bar_chart,
                index: 1,
                current: currentScreen,
                onTap: _onTabTap,
              ),
              NavItem(
                icon: Icons.swap_horiz,
                index: 2,
                current: currentScreen,
                onTap: _onTabTap,
              ),
              NavItem(
                icon: Icons.layers_outlined,
                index: 3,
                current: currentScreen,
                onTap: _onTabTap,
              ),
              NavItem(
                icon: Icons.person_outline,
                index: 4,
                current: currentScreen,
                onTap: _onTabTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final int current;
  final void Function(int) onTap;

  const NavItem({
    required this.icon,
    required this.index,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = index == current;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF00C569)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
