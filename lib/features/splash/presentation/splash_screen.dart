import 'package:flutter/material.dart';

import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_spacing.dart';
import 'widgets/splash_brand.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colors.surface,
              colors.primaryContainer.withValues(alpha: .24),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: AppDurations.slow,
                curve: Curves.easeOut,
                child: AnimatedScale(
                  scale: _visible ? 1 : .96,
                  duration: AppDurations.slow,
                  curve: Curves.easeOutCubic,
                  child: const SplashBrand(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
