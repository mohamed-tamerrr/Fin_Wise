import 'package:fin_wise/core/database/isar_service.dart';
import 'package:fin_wise/core/utils/app_router.dart';
import 'package:fin_wise/features/transactions/data/models/transaction_model.dart';
import 'package:fin_wise/features/transactions/data/repo/transaction_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.init();

  final transaction = TransactionModel()
    ..title = "Dinner"
    ..amount = 26
    ..date = DateTime.now()
    ..categoryId = 1;

  await TransactionRepo().saveTransaction(transaction);

  final test = await TransactionRepo().getTransactions();

  print(test.length);

  runApp(const FinWise());
}

class FinWise extends StatelessWidget {
  const FinWise({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
