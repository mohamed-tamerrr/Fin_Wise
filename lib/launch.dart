import 'package:fin_wise/core/utils/app_colors.dart';
import 'package:fin_wise/shared/custom_btn.dart';
import 'package:fin_wise/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fin_wise/core/utils/app_router.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LaunchView extends StatelessWidget {
  const LaunchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          children: [
            Gap(220),
            SvgPicture.asset(
              'assets/splash/logo.svg',
              width: 200,
              colorFilter: ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            const Gap(20),
            SvgPicture.asset(
              'assets/splash/FinWise.svg',
              colorFilter: ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            const Gap(3),
            CustomText(
              textAlign: TextAlign.center,
              text:
                  'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod. ',
            ),
            const Gap(40),
            CustomButton(
              onTap: () => context.push(AppRouter.loginView),
              text: 'Log In',
              textColor: Color(0xff093030),
              width: 200,
              color: AppColors.primary,
            ),
            const Gap(16),
            CustomButton(
              onTap: () => context.push(AppRouter.signupView),
              text: 'Sign Up',
              width: 200,
              color: AppColors.secondary,
              textColor: Color(0xff0E3E3E),
            ),
          ],
        ),
      ),
    );
  }
}
