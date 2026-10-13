import 'package:flutter/material.dart';

import 'app_text_field.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    required this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    super.key,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hint: hint,
      prefixIcon: Icons.search_rounded,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
