import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class CircleDot extends StatelessWidget {
  const CircleDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        width: 6,
        height: 6,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.circleDotColor,
        ),
      ),
    );
  }
}
