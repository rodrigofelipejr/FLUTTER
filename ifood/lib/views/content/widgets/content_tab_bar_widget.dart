import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_typography.dart';

class ContentTabBarWidget extends StatelessWidget {
  final TabController tabController;
  final Function(int) onTap;

  const ContentTabBarWidget({
    Key? key,
    required this.tabController,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 170,
      ),
      child: TabBar(
        onTap: onTap,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: AppColors.kBlack54,
        labelStyle: AppTypography.tabBarStyle(context),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        indicator: MaterialIndicator(
          color: AppColors.primaryColor,
          height: 2,
          bottomLeftRadius: 5,
          bottomRightRadius: 5,
        ),
        controller: tabController,
        tabs: [
          Tab(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Restaurantes'),
            ),
          ),
          Tab(
            child: Text('Mercados'),
          ),
        ],
      ),
    );
  }
}
