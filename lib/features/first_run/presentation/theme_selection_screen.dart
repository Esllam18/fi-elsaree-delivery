import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../core/settings/app_settings_controller.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/ui/buttons/app_button.dart';

class ThemeSelectionScreen extends ConsumerStatefulWidget {
  const ThemeSelectionScreen({super.key});

  @override
  ConsumerState<ThemeSelectionScreen> createState() =>
      _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends ConsumerState<ThemeSelectionScreen> {
  ThemeMode _selected = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

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
                  Icon(Icons.contrast_rounded,
                      size: 44, color: theme.colorScheme.primary),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    isArabic ? 'اختر المظهر المناسب لك' : 'Choose your appearance',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isArabic
                        ? 'يمكنك تغييره لاحقًا من الإعدادات'
                        : 'You can change it later in settings',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    children: [
                      Expanded(
                        child: _ThemeCard(
                          selected: _selected == ThemeMode.light,
                          icon: Icons.light_mode_rounded,
                          label: isArabic ? 'فاتح' : 'Light',
                          onTap: () => _select(ThemeMode.light),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: _ThemeCard(
                          selected: _selected == ThemeMode.dark,
                          icon: Icons.dark_mode_rounded,
                          label: isArabic ? 'داكن' : 'Dark',
                          onTap: () => _select(ThemeMode.dark),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                  AppButton(
                    label: isArabic ? 'متابعة' : 'Continue',
                    onPressed: () async {
                      await ref
                          .read(appSettingsProvider.notifier)
                          .setThemeMode(_selected);
                      if (context.mounted) context.go(AppRoutes.onboarding);
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

  void _select(ThemeMode mode) {
    setState(() => _selected = mode);
    ref.read(appSettingsProvider.notifier).setThemeMode(mode);
  }
}

class _ThemeCard extends StatelessWidget {
  const _ThemeCard({
    required this.selected,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final bool selected;
  final IconData icon;
  final String label;
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
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: selected ? colors.primary : colors.outlineVariant,
            width: selected ? 1.5 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
            child: Column(
              children: [
                Icon(icon, size: 36, color: colors.primary),
                const SizedBox(height: 12),
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
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
