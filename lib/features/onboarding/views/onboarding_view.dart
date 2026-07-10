import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/features/onboarding/data/models/onboarding_model.dart';
import 'package:fin_wise/features/onboarding/widgets/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = const [
    OnboardingPage(
      title: 'Welcome To\nExpense Manager',
      imagePath: 'assets/onboarding/first.png',
    ),
    OnboardingPage(
      title: '¿Are You Ready To\nTake Control Of\nYour Finaces?',
      imagePath: 'assets/onboarding/second.png',
    ),
  ];

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      context.push('/launch');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          const Gap(123),
          // Header title area
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) =>
                  setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                return _buildPage(_pages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Column(
      children: [
        Expanded(
          child: Text(
            page.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.35,
              letterSpacing: 0.2,
            ),
          ),
        ),
        const Gap(60),

        // ── White card area ──
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Illustration circle
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(page.imagePath),
                    // If you have real assets, replace the Text above with:
                    // Image.asset(page.imagePath, fit: BoxFit.contain)
                  ),
                ),

                // ── Next button + dots ──
                Column(
                  children: [
                    GestureDetector(
                      onTap: _onNext,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    const Gap(12),
                    DotsIndicator(
                      count: _pages.length,
                      current: _currentPage,
                      activeColor: AppColors.primary,
                    ),
                    const Gap(32),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
