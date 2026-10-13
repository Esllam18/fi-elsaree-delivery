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
    final media = MediaQuery.of(context);
    final size = media.size;
    final shortest = math.min(size.width, size.height);
    final textScale = media.textScaler.scale(1);
    final compactHeight = size.height < 640 || textScale > 1.25;

    final logoFactor = compactHeight ? .24 : .30;
    final logoMax = compactHeight ? 112.0 : 132.0;
    final logo = (shortest * logoFactor).clamp(92.0, logoMax).toDouble();
    final horizontalInset = size.width < 360 ? 32.0 : 48.0;
    final width = (size.width - horizontalInset).clamp(260.0, 430.0).toDouble();
    final gapFactor = compactHeight ? .035 : .052;
    final gapMax = compactHeight ? 32.0 : 46.0;
    final gap = (size.height * gapFactor).clamp(20.0, gapMax).toDouble();

    return SplashResponsive._(
      logoSize: logo,
      contentWidth: width,
      brandToLoaderGap: gap,
    );
  }
}
