import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/views/content/widgets/bottom_navigator_item_widget.dart';
import 'package:ifood/views/content/widgets/bottom_navigator_widget.dart';
import 'package:ifood/views/content/widgets/content_tab_bar_widget.dart';
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

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                HeaderLocationWidget(
                  location: 'Av. Primeiro de Junho, 2004',
                ),
                ContentTabBarWidget(
                  tabController: tabController,
                  onTap: (index) {},
                ),
              ],
            ),
          ),
          BottomNavigatorWidget(
            currentIndex: _currentIndex,
            onTap: (index) {
              print(index);
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigatorItemWidget(
                label: 'Início',
                icon: AppIcons.home,
                activeIcon: AppIcons.homeActive,
              ),
              BottomNavigatorItemWidget(
                label: 'Busca',
                icon: AppIcons.search,
                activeIcon: AppIcons.searchActive,
              ),
              BottomNavigatorItemWidget(
                label: 'Pedidos',
                icon: AppIcons.orders,
                activeIcon: AppIcons.ordersActive,
              ),
              BottomNavigatorItemWidget(
                label: 'Perfil',
                icon: AppIcons.profile,
                activeIcon: AppIcons.profileActive,
              ),
            ],
          )
        ],
      ),
    );
  }
}
