import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';
import '../buttons/app_button.dart';
import '../buttons/app_danger_button.dart';
import '../buttons/app_outlined_button.dart';
import '../buttons/app_secondary_button.dart';
import '../buttons/app_text_button.dart';
import '../feedback/app_banner.dart';
import '../inputs/app_search_field.dart';
import '../inputs/app_text_field.dart';
import '../layout/app_page.dart';
import '../states/app_skeleton.dart';
import '../surfaces/app_card.dart';

class DesignSystemShowcase extends StatelessWidget {
  const DesignSystemShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
        children: [
          Text('Design System', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.xl),
          const AppBanner(message: 'Preview only — not a production route.'),
          const SizedBox(height: AppSpacing.md),
          AppButton(label: 'Primary', onPressed: () {}),
          const SizedBox(height: AppSpacing.xs),
          AppSecondaryButton(label: 'Secondary', onPressed: () {}),
          const SizedBox(height: AppSpacing.xs),
          AppOutlinedButton(label: 'Outlined', onPressed: () {}),
          const SizedBox(height: AppSpacing.xs),
          AppDangerButton(label: 'Destructive', onPressed: () {}),
          AppTextButton(label: 'Text action', onPressed: () {}),
          const SizedBox(height: AppSpacing.lg),
          const AppTextField(label: 'Field label', hint: 'Field value'),
          const SizedBox(height: AppSpacing.sm),
          const AppSearchField(hint: 'Search'),
          const SizedBox(height: AppSpacing.lg),
          const AppCard(child: Text('Compact premium card surface')),
          const SizedBox(height: AppSpacing.lg),
          const AppSkeleton(height: 16, width: 180),
          const SizedBox(height: AppSpacing.xs),
          const AppSkeleton(height: 88),
        ],
      ),
    );
  }
}
