import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_typography.dart';
import 'package:ifood/models/category.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;

  const CategoryItemWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Image.asset(
            category.picture,
            height: 60,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            category.name,
            style: AppTypography.smallText(context).copyWith(color: AppColors.kGrey),
          ),
        ),
      ],
    );
  }
}
