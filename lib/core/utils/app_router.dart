import '../../features/auth/views/login_view.dart';
import '../../features/auth/views/signup_view.dart';
import '../../features/categories/data/models/category_model.dart';
import '../../features/categories/views/add_expense_view.dart';
import '../../features/categories/views/category_view.dart';
import '../../features/categories/views/category_view_details.dart';

import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/profile/views/edit_profile_view.dart';
import '../../features/transactions/cubit/transaction_cubit.dart';
import '../../features/transactions/data/repo/transaction_repo.dart';
import '../../launch.dart';
import '../../root.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      GoRoute(
        path: '/',
        builder: (context, state) => const Root(),
      ),
      GoRoute(
        path: onboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: launchView,
        builder: (context, state) => const LaunchView(),
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
        builder: (context, state) => const CategoryView(),
      ),
      GoRoute(
        path: categoryViewDetails,
        builder: (context, state) {
          final category = state.extra as CategoryModel;
          return BlocProvider(
            create: (context) => TransactionCubit(
              transactionRepo: context.read<TransactionRepo>(),
            )..watchByCategory(category.id),
            child: CategoryViewDetails(category: category),
          );
        },
      ),
      GoRoute(
        path: addExpenseView,
        builder: (context, state) {
          final category = state.extra as CategoryModel;
          return AddExpenseView(category: category);
        },
      ),
      GoRoute(
        path: editProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
    ],
  );
}
