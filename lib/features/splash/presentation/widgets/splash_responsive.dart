import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class SplashResponsive {
  const SplashResponsive._({
    required this.logoSize,
    required this.contentWidth,
    required this.brandToLoaderGap,
  });

  final double logoSize;
  final double contentWidth;
  final double brandToLoaderGap;

  factory SplashResponsive.of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final shortest = math.min(size.width, size.height);
    final logo = (shortest * .30).clamp(104.0, 132.0).toDouble();
    final width = (size.width - 48).clamp(280.0, 430.0).toDouble();
    final gap = (size.height * .052).clamp(28.0, 46.0).toDouble();
    return SplashResponsive._(
      logoSize: logo,
      contentWidth: width,
      brandToLoaderGap: gap,
    );
  }
}
