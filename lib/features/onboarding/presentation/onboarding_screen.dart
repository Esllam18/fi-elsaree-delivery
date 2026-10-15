import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../core/settings/app_settings_controller.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/ui/buttons/app_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ar = Localizations.localeOf(context).languageCode == 'ar';
    final pages = ar ? _arabicPages : _englishPages;
    final last = _index == pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.lg,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () => _finish(context),
                      child: Text(ar ? 'تخطي' : 'Skip'),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: pages.length,
                      onPageChanged: (value) => setState(() => _index = value),
                      itemBuilder: (context, index) =>
                          _OnboardingPage(data: pages[index]),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 7,
                        width: i == _index ? 24 : 7,
                        decoration: BoxDecoration(
                          color: i == _index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(
                    label: last
                        ? (ar ? 'ابدأ الآن' : 'Get started')
                        : (ar ? 'التالي' : 'Next'),
                    onPressed: () {
                      if (last) {
                        _finish(context);
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                        );
                      }
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

  Future<void> _finish(BuildContext context) async {
    await ref.read(firstRunStorageProvider).completeOnboarding();
    if (context.mounted) context.go(AppRoutes.sessionGate);
  }
}

class _OnboardingData {
  const _OnboardingData(this.icon, this.title, this.body);
  final IconData icon;
  final String title;
  final String body;
}

const _arabicPages = [
  _OnboardingData(
    Icons.shopping_bag_rounded,
    'كل احتياجاتك في مكان واحد',
    'اطلب احتياجاتك اليومية بسهولة، وسيهتم في السريع بالباقي.',
  ),
  _OnboardingData(
    Icons.delivery_dining_rounded,
    'توصيل سريع وواضح',
    'تابع طلبك خطوة بخطوة من لحظة الطلب وحتى وصوله إليك.',
  ),
  _OnboardingData(
    Icons.location_on_rounded,
    'اطلب من مكانك',
    'احفظ عناوينك وكرر طلباتك بسهولة لتجربة أسرع كل مرة.',
  ),
];

const _englishPages = [
  _OnboardingData(
    Icons.shopping_bag_rounded,
    'Everything you need, in one place',
    'Order your daily needs easily and let Fi ElSaree handle the rest.',
  ),
  _OnboardingData(
    Icons.delivery_dining_rounded,
    'Fast, clear delivery',
    'Follow your order step by step from placement to your doorstep.',
  ),
  _OnboardingData(
    Icons.location_on_rounded,
    'Order from where you are',
    'Save your addresses and repeat orders easily for a faster experience.',
  ),
];

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.data});
  final _OnboardingData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final visualSize = (size.shortestSide * .48).clamp(170.0, 250.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: visualSize,
          height: visualSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.primaryContainer.withValues(alpha: .55),
          ),
          alignment: Alignment.center,
          child: Container(
            width: visualSize * .62,
            height: visualSize * .62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: .10),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Icon(
              data.icon,
              size: visualSize * .30,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          data.title,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.3,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          data.body,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.65,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
