import 'package:flutter/material.dart';

import '../../../../core/config/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class SplashBrandMark extends StatelessWidget {
  const SplashBrandMark({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.accent.withValues(alpha: dark ? .24 : .12),
              blurRadius: dark ? 36 : 26,
              spreadRadius: dark ? 2 : 0,
            ),
          ],
        ),
        child: Image.asset(
          AppAssets.logo,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
          semanticLabel: 'Fi ElSaree',
        ),
      ),
    );
  }
}
