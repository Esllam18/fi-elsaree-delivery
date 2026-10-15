import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../core/config/app_assets.dart';
import '../../../core/localization/context_extensions.dart';
import '../../../core/settings/app_settings_controller.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_spacing.dart';
import 'widgets/splash_brand.dart';
import 'widgets/splash_loader.dart';
import 'widgets/splash_responsive.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _visible = true);
      unawaited(_continue());
    });
  }

  Future<void> _continue() async {
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;

    final storage = ref.read(firstRunStorageProvider);
    final route = !storage.hasSelectedLocale
        ? AppRoutes.language
        : !storage.hasSelectedTheme
            ? AppRoutes.themeSelection
            : !storage.onboardingCompleted
                ? AppRoutes.onboarding
                : AppRoutes.sessionGate;

    context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final responsive = SplashResponsive.of(context);
    final l10n = context.l10n;
    final background = dark
        ? AppAssets.splashBackgroundDark
        : AppAssets.splashBackgroundLight;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              background,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: responsive.contentWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: AnimatedOpacity(
                    opacity: _visible ? 1 : 0,
                    duration: AppDurations.slow,
                    curve: Curves.easeOut,
                    child: AnimatedScale(
                      scale: _visible ? 1 : .965,
                      duration: AppDurations.slow,
                      curve: Curves.easeOutCubic,
                      child: Column(
                        children: [
                          const Spacer(flex: 4),
                          SplashBrand(logoSize: responsive.logoSize),
                          SizedBox(height: responsive.brandToLoaderGap),
                          SplashLoader(
                            arabicLabel: l10n.initializing,
                            englishLabel: l10n.initializingSecondary,
                          ),
                          const Spacer(flex: 3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
