import 'package:flutter/material.dart';

import '../../theme/app_radius.dart';

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({
    this.width = double.infinity,
    required this.height,
    this.radius = AppRadius.small,
    super.key,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
