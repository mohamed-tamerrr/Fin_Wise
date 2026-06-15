import 'package:fin_wise/features/auth/views/login_view.dart';
import 'package:fin_wise/features/auth/views/signup_view.dart';
import 'package:fin_wise/features/home/views/home_view.dart';
import 'package:fin_wise/features/onboarding/views/onboarding_view.dart';
import 'package:fin_wise/launch.dart';
import 'package:fin_wise/root.dart';

import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/home';
  static const launchView = '/launch';
  static const onboardingView = '/onboarding';
  static const loginView = '/login';
  static const signupView = '/signup';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => Root()),
      GoRoute(
        path: onboardingView,
        builder: (context, state) => OnboardingView(),
      ),
      GoRoute(
        path: launchView,
        builder: (context, state) => LaunchView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: signupView,
        builder: (context, state) => const SignupView(),
      ),
    ],
  );
}
