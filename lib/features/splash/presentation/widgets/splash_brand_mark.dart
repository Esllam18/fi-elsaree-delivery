import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class SplashBrandMark extends StatelessWidget {
  const SplashBrandMark({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 92,
      height: 92,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.accent, AppColors.primary],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: dark ? .24 : .18),
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(
        Icons.bolt_rounded,
        size: 48,
        color: Colors.white,
      ),
    );
  }
}
