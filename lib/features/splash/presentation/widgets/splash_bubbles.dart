import 'package:flutter/material.dart';

class SplashBubbles extends StatelessWidget {
  const SplashBubbles({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return IgnorePointer(
      child: Stack(
        children: [
          _Bubble(
            alignment: const Alignment(1.28, -1.08),
            size: 260,
            dark: dark,
          ),
          _Bubble(
            alignment: const Alignment(-1.42, .28),
            size: 310,
            dark: dark,
          ),
          _Bubble(
            alignment: const Alignment(.98, 1.34),
            size: 300,
            dark: dark,
            warm: true,
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    required this.alignment,
    required this.size,
    required this.dark,
    this.warm = false,
  });

  final Alignment alignment;
  final double size;
  final bool dark;
  final bool warm;

  @override
  Widget build(BuildContext context) {
    final base = warm ? const Color(0xFFFFB12B) : const Color(0xFF2F80ED);
    return Align(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            center: const Alignment(-.35, -.35),
            colors: [
              base.withValues(alpha: dark ? .16 : .10),
              base.withValues(alpha: dark ? .07 : .035),
              Colors.transparent,
            ],
            stops: const [0, .62, 1],
          ),
          border: Border.all(
            color: Colors.white.withValues(alpha: dark ? .055 : .42),
          ),
        ),
      ),
    );
  }
}
