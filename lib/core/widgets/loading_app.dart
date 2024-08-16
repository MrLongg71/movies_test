import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({super.key, this.color, this.size = 30});

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FittedBox(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
