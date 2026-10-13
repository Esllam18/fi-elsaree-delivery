import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBrandMark extends StatelessWidget {
  const SplashBrandMark({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 124,
      height: 124,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1688FF).withValues(alpha: dark ? .28 : .15),
            blurRadius: dark ? 38 : 28,
            spreadRadius: dark ? 2 : 0,
          ),
        ],
      ),
      child: SvgPicture.asset(
        'assets/branding/fi_elsaree_mark.svg',
        fit: BoxFit.contain,
        semanticsLabel: 'Fi ElSaree',
      ),
    );
  }
}
