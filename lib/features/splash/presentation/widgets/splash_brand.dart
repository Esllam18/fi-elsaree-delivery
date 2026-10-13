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
          l10n.appName,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: GoogleFonts.cairo(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            height: 1.15,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.deliveryLabel,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 3.8,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          l10n.appTagline,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: GoogleFonts.cairo(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.4,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          l10n.appTaglineSecondary,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.35,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: .78),
          ),
        ),
      ],
    );
  }
}
