import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/localization/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import 'splash_brand_mark.dart';

class SplashBrand extends StatelessWidget {
  const SplashBrand({required this.logoSize, super.key});

  final double logoSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SplashBrandMark(size: logoSize),
        const SizedBox(height: AppSpacing.md),
        Text(
          'في السريع',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.deliveryLabel,
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
          l10n.appTagline,
          textDirection: context.isRtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          l10n.appTaglineSecondary,
          textDirection: context.isRtl ? TextDirection.ltr : TextDirection.rtl,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: GoogleFonts.inter(
            fontSize: 12.5,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: .82),
          ),
        ),
      ],
    );
  }
}
