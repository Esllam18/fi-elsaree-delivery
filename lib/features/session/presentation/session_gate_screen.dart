import 'package:flutter/material.dart';

import '../../../core/localization/context_extensions.dart';
import '../../../core/theme/app_spacing.dart';

class SessionGateScreen extends StatelessWidget {
  const SessionGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: 36,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    strokeCap: StrokeCap.round,
                    backgroundColor:
                        theme.colorScheme.primary.withValues(alpha: .12),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  l10n.initializing,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
