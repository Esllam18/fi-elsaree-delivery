import 'package:flutter/material.dart';

enum AppSnackTone { neutral, success, warning, error }

abstract final class AppSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    AppSnackTone tone = AppSnackTone.neutral,
  }) {
    final colors = Theme.of(context).colorScheme;
    final background = switch (tone) {
      AppSnackTone.success => const Color(0xFF219653),
      AppSnackTone.warning => const Color(0xFFF2A93B),
      AppSnackTone.error => colors.error,
      AppSnackTone.neutral => colors.inverseSurface,
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: background,
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
        ),
      );
  }
}
