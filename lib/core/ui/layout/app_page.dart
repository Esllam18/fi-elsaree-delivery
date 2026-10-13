import 'package:flutter/material.dart';

import '../../responsive/responsive_value.dart';
import '../../theme/app_spacing.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.safeArea = true,
    super.key,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool safeArea;

  @override
  Widget build(BuildContext context) {
    final maxWidth = responsiveValue<double>(
      context,
      compact: double.infinity,
      medium: 720,
      expanded: 840,
    );

    Widget body = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: child,
        ),
      ),
    );
    if (safeArea) body = SafeArea(child: body);

    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
