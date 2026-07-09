import 'package:fin_wise/core/database/isar_service.dart';
import 'package:fin_wise/core/utils/app_router.dart';
import 'package:fin_wise/features/categories/cubit/category_cubit.dart';
import 'package:fin_wise/features/categories/data/repos/category_repository.dart';
import 'package:fin_wise/features/transactions/cubit/transaction_cubit.dart';
import 'package:fin_wise/features/transactions/data/models/transaction_model.dart';
import 'package:fin_wise/features/transactions/data/repo/transaction_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.init();
  runApp(const FinWise());
}

class FinWise extends StatelessWidget {
  const FinWise({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return CategoryCubit(
              categoryRepo: CategoryRepository(),
            )..getCategories();
          },
        ),

        BlocProvider(
          create: (_) {
            return TransactionCubit(TransactionRepo())
              ..watchAll();
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
    );
  }
}
