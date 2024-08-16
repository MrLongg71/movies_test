import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/typography.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.icPath = Icons.error_outline,
    required this.errMsg,
    this.onRetry,
    this.retryText,
  });

  const CustomErrorWidget.network({
    super.key,
    this.icPath = Icons.network_check,
    this.errMsg = 'Please, check network connect!',
    this.onRetry,
    this.retryText,
  });

  final IconData? icPath;
  final String? errMsg;
  final String? retryText;
  final Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icPath,
              size: 150,
              color: AppColors.whiteColor,
            ),
            const SizedBox(height: 24),
            Text(
              errMsg ?? '',
              textAlign: TextAlign.center,
              style: const Sub2(color: AppColors.whiteColor),
            ),
            const SizedBox(height: 10),
            if (onRetry != null)
              MaterialButton(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: AppColors.redColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Text(
                  retryText ?? 'Retry',
                  style: const Sub2(
                    color: AppColors.whiteColor,
                  ),
                ),
                onPressed: () => onRetry?.call(),
              ),
          ],
        ),
      ),
    );
  }
}
