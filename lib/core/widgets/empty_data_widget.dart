import 'package:flutter/material.dart';
import 'package:movies_test/core/themes/typography.dart';

import '../constants/constants.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          IconConstants.iconMovie,
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 12),
        const Text(
          'Empty data',
          style: Sub2(),
        )
      ],
    );
  }
}
