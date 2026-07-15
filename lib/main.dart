import 'package:isar/isar.dart';

import 'core/database/isar_service.dart';
import 'core/utils/app_router.dart';
import 'features/categories/cubit/category_cubit.dart';
import 'features/categories/data/repos/category_repository.dart';
import 'features/transactions/cubit/transaction_cubit.dart';
import 'features/transactions/data/repo/transaction_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await IsarService.init();
  final categoryRepository = CategoryRepository(isar);
  // await categoryRepository.seedDefaultCategoriesIfNeeded();
  runApp(
    FinWise(
      isar: isar,
      categoryRepository: categoryRepository,
    ),
  );
}

class FinWise extends StatelessWidget {
  const FinWise({super.key, required this.isar, required this.categoryRepository});
  final Isar isar;
  final CategoryRepository categoryRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CategoryRepository>.value(value: categoryRepository),
        RepositoryProvider(
          create: (context) => TransactionRepo(isar),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CategoryCubit(categoryRepo: categoryRepository)..getCategories(),
          ),

          BlocProvider(
            create: (_) {
              return TransactionCubit(transactionRepo: TransactionRepo(isar))..watchAll();
            },
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
