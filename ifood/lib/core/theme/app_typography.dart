import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';

class AppTypography {
  static TextStyle bodyText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle smallText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 12.0,
        );
  }

  static TextStyle bodyTextBold(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle tabBarStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor,
        );
  }

  static TextStyle localTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 13.0,
        );
  }
}
