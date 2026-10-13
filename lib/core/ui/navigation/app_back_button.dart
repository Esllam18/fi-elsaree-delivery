import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final direction = Directionality.of(context);
    final icon = direction == TextDirection.rtl
        ? CupertinoIcons.chevron_right
        : CupertinoIcons.chevron_left;

    return IconButton(
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
      icon: Icon(icon, size: 22),
    );
  }
}
