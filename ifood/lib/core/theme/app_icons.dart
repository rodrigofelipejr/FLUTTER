import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifood/core/theme/app_colors.dart'; 

const String pathIcons = 'assets/icons/';

class AppIcons {
  static const arrowDown = '${pathIcons}arrow_down.svg';
}

class AppIcon extends StatelessWidget {
  final String icon;
  final Size size;
  final Color color;

  const AppIcon(
    this.icon, {
    Key? key,
    this.size = const Size(24, 24),
    this.color = AppColors.kBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: size.height,
      width: size.height,
      color: color,
    );
  }
}
