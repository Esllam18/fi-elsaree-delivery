import 'package:flutter/material.dart';

import 'app_state_view.dart';

class AppSuccessView extends StatelessWidget {
  const AppSuccessView({
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => AppStateView(
        icon: Icons.check_circle_outline_rounded,
        title: title,
        message: message,
        actionLabel: actionLabel,
        onAction: onAction,
        tone: AppStateTone.success,
      );
}
