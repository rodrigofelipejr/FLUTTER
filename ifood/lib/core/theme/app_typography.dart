import 'package:flutter/material.dart';

class AppTypography {
  static TextStyle bodyText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle? bodyTextBold(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w700,
        );
  }
}
