import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/core/theme/app_typography.dart';

class HeaderLocationWidget extends StatelessWidget {
  final String location;

  const HeaderLocationWidget({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 0.0, bottom: 8.0, left: 16.0),
          child: Text(
            location,
            style: AppTypography.bodyText(context),
          ),
        ),
        AppIcon(
          AppIcons.arrowDown,
          size: Size(20, 20),
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
