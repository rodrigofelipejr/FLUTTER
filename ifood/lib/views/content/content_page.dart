import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_typography.dart';
import 'package:ifood/views/content/widgets/header_location_widget.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          HeaderLocationWidget(
            location: 'Av. Primeiro de Junho, 2004',
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 170,
            ),
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelColor: AppColors.kBlack,
              unselectedLabelColor: AppColors.kBlack54,
              labelStyle: AppTypography.bodyTextBold(context)!.copyWith(color: AppColors.kBlack),
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
          )
        ],
      ),
    );
  }
}
