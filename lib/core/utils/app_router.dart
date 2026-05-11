import 'package:fin_wise/features/onboarding/views/onboarding_view.dart';
import 'package:fin_wise/launch.dart';
import 'package:fin_wise/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/home';
  static const launchView = '/launch';
  static const onboardingView = '/onboarding';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: onboardingView,
        builder: (context, state) => OnboardingView(),
      ),
      GoRoute(
        path: launchView,
        builder: (context, state) => LaunchView(),
      ),
    ],
  );
}
