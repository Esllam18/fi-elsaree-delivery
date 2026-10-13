import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          dimension: 38,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: theme.colorScheme.primary.withValues(alpha: .12),
            strokeCap: StrokeCap.round,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          arabicLabel,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            height: 1.4,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          englishLabel,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            height: 1.35,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: .78),
          ),
        ),
      ],
    );
  }
}
