import 'package:flutter/material.dart';

import '../../../shared/widgets/custom_text.dart';

class NoTransActionsWidget extends StatelessWidget {
  const NoTransActionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: CustomText(
          text: 'No transactions yet',
        ),
      ),
    );
  }
}
