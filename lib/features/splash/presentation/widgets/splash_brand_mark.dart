import 'package:flutter/material.dart';

class SplashBrandMark extends StatelessWidget {
  const SplashBrandMark({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1688FF).withValues(alpha: dark ? .24 : .12),
              blurRadius: dark ? 36 : 26,
              spreadRadius: dark ? 2 : 0,
            ),
          ],
        ),
        child: Image.asset(
          'assets/branding/fi_elsaree_logo.png',
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
          semanticLabel: 'Fi ElSaree',
        ),
      ),
    );
  }
}
