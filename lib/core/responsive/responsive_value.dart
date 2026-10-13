import 'package:flutter/widgets.dart';

import 'app_breakpoints.dart';

T responsiveValue<T>(
  BuildContext context, {
  required T compact,
  T? medium,
  T? expanded,
}) {
  final width = MediaQuery.sizeOf(context).width;
  if (width >= AppBreakpoints.expanded) return expanded ?? medium ?? compact;
  if (width >= AppBreakpoints.compact) return medium ?? compact;
  return compact;
}
