import 'package:fin_wise/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FinWise());
}

class FinWise extends StatelessWidget {
  const FinWise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
