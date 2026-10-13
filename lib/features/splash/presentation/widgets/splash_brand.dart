import 'package:flutter/material.dart';

import '../../../../core/localization/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import 'splash_brand_mark.dart';

class SplashBrand extends StatelessWidget {
  const SplashBrand({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SplashBrandMark(),
        const SizedBox(height: AppSpacing.lg),
        Text(
          context.l10n.appName,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: context.isRtl ? 0 : -.4,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          context.l10n.appTagline,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
