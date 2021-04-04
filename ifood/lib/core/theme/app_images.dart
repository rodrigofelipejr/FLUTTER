import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifood/core/theme/app_colors.dart';

const String pathImages = 'assets/images/categories/';

class AppImages {
  static const acai = '${pathImages}acai.jpg';
  static const brasileira = '${pathImages}brasileira.jpg';
  static const cafe = '${pathImages}cafe.jpg';
  static const doces = '${pathImages}doces.jpg';
  static const japonesa = '${pathImages}japonesa.jpg';
  static const lanches = '${pathImages}lanches.jpg';
  static const marmita = '${pathImages}marmita.jpg';
  static const mercado = '${pathImages}mercado.jpg';
  static const padaria = '${pathImages}padaria.jpg';
  static const pizza = '${pathImages}pizza.jpg';
  static const promocoes = '${pathImages}promocoes.jpg';
  static const saudavel = '${pathImages}saudavel.jpg';
  static const vegetariano = '${pathImages}vegetariano.jpg';
  static const vr = '${pathImages}vr.jpg';
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
