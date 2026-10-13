import 'package:flutter/material.dart';

import 'app_state_view.dart';

class AppOfflineView extends StatelessWidget {
  const AppOfflineView({
    required this.title,
    this.message,
    this.retryLabel,
    this.onRetry,
    super.key,
  });

  final String title;
  final String? message;
  final String? retryLabel;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => AppStateView(
        icon: Icons.wifi_off_rounded,
        title: title,
        message: message,
        actionLabel: retryLabel,
        onAction: onRetry,
        tone: AppStateTone.warning,
      );
}
