import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../themes/app_colors.dart';
import '../themes/typography.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            IconConstants.iconMovie,
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 12),
          const Text(
            'Empty data',
            style: Sub2(color: AppColors.whiteColor),
          )
        ],
      ),
    );
  }
}
