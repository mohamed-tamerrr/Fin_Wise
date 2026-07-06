import 'package:fin_wise/features/auth/views/login_view.dart';
import 'package:fin_wise/features/auth/views/signup_view.dart';
import 'package:fin_wise/features/categories/views/add_expense_view.dart';
import 'package:fin_wise/features/categories/views/category_view.dart';
import 'package:fin_wise/features/categories/views/category_view_details.dart';

import 'package:fin_wise/features/onboarding/views/onboarding_view.dart';
import 'package:fin_wise/features/profile/views/edit_profile_view.dart';
import 'package:fin_wise/launch.dart';
import 'package:fin_wise/root.dart';

import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/home';
  static const launchView = '/launch';
  static const onboardingView = '/onboarding';
  static const loginView = '/login';
  static const signupView = '/signup';
  static const categoryView = '/categories';
  static const categoryViewDetails = '/category-details';
  static const addExpenseView = '/add-expense';
  static const editProfileView = '/edit-profile';
  static const settingsProfileView = '/settings-profile';
  static const securityProfileView = '/security-profile';
  static const helpProfileView = '/help-profile';

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
      GoRoute(
        path: categoryView,
        builder: (context, state) => CategoryView(),
      ),
      GoRoute(
        path: categoryViewDetails,
        builder: (context, state) {
          final title = state.extra as String;
          return CategoryViewDetails(title: title);
        },
      ),
      GoRoute(
        path: addExpenseView,
        builder: (context, state) => AddExpenseView(),
      ),
      GoRoute(
        path: editProfileView,
        builder: (context, state) => EditProfileView(),
      ),
    ],
  );
}
