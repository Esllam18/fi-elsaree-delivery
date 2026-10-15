import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../core/localization/context_extensions.dart';
import '../../../core/settings/app_settings_controller.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/ui/buttons/app_button.dart';

class LanguageScreen extends ConsumerStatefulWidget {
  const LanguageScreen({super.key});

  @override
  ConsumerState<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen> {
  String _selected = 'ar';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  Icon(Icons.translate_rounded,
                      size: 44, color: theme.colorScheme.primary),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    l10n.languageTitle,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.languageSubtitle,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  _LanguageCard(
                    selected: _selected == 'ar',
                    title: l10n.arabic,
                    subtitle: l10n.arabicSubtitle,
                    direction: TextDirection.rtl,
                    alignment: Alignment.centerRight,
                    onTap: () => setState(() => _selected = 'ar'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _LanguageCard(
                    selected: _selected == 'en',
                    title: l10n.english,
                    subtitle: l10n.englishSubtitle,
                    direction: TextDirection.ltr,
                    alignment: Alignment.centerLeft,
                    onTap: () => setState(() => _selected = 'en'),
                  ),
                  const Spacer(flex: 2),
                  AppButton(
                    label: _selected == 'ar'
                        ? l10n.continueLabel
                        : l10n.continueEnglish,
                    onPressed: () async {
                      await ref
                          .read(appSettingsProvider.notifier)
                          .setLocale(Locale(_selected));
                      if (context.mounted) context.go(AppRoutes.themeSelection);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.direction,
    required this.alignment,
    required this.onTap,
  });

  final bool selected;
  final String title;
  final String subtitle;
  final TextDirection direction;
  final Alignment alignment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: selected ? colors.primaryContainer : colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: selected ? colors.primary : colors.outlineVariant,
            width: selected ? 1.5 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Align(
              alignment: alignment,
              child: Directionality(
                textDirection: direction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            )),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
