import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/localization/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import 'splash_brand_mark.dart';

class SplashBrand extends StatelessWidget {
  const SplashBrand({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SplashBrandMark(),
        const SizedBox(height: AppSpacing.md),
        Text(
          'في السريع',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Delivery',
          textDirection: TextDirection.ltr,
          style: GoogleFonts.inter(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            letterSpacing: 4.2,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          context.l10n.appTagline,
          textDirection: context.isRtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          context.isRtl ? 'Your needs, delivered fast' : 'كل احتياجاتك... أسرع',
          textDirection: context.isRtl ? TextDirection.ltr : TextDirection.rtl,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 12.5,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: .82),
          ),
        ),
      ],
    );
  }
}
