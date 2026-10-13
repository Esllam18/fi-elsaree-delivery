import 'package:flutter/material.dart';

import '../../theme/app_radius.dart';

class AppDangerButton extends StatelessWidget {
  const AppDangerButton({
    required this.label,
    required this.onPressed,
    this.expand = true,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final button = FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 48),
        backgroundColor: colors.error,
        foregroundColor: colors.onError,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
        ),
      ),
      child: Text(label),
    );
    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
