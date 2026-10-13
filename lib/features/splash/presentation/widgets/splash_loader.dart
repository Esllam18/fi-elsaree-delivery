import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';

class SplashLoader extends StatelessWidget {
  const SplashLoader({
    required this.arabicLabel,
    required this.englishLabel,
    super.key,
  });

  final String arabicLabel;
  final String englishLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: 46,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            backgroundColor: theme.colorScheme.primary.withValues(alpha: .12),
            strokeCap: StrokeCap.round,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          arabicLabel,
          textDirection: TextDirection.rtl,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          englishLabel,
          textDirection: TextDirection.ltr,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
