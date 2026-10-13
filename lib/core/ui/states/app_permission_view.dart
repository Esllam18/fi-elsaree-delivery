import 'package:flutter/material.dart';

import 'app_state_view.dart';

class AppPermissionView extends StatelessWidget {
  const AppPermissionView({
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.onAction,
    super.key,
  });

  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) => AppStateView(
        icon: Icons.lock_outline_rounded,
        title: title,
        message: message,
        actionLabel: actionLabel,
        onAction: onAction,
        tone: AppStateTone.info,
      );
}
