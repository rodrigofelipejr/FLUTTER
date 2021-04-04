import 'package:flutter/material.dart';
import 'package:ifood/controllers/content_controller.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/models/category.dart';
import 'package:ifood/views/content/widgets/bottom_navigator_item_widget.dart';
import 'package:ifood/views/content/widgets/bottom_navigator_widget.dart';
import 'package:ifood/views/content/widgets/category_item_widget.dart';
import 'package:ifood/views/content/widgets/content_tab_bar_widget.dart';
import 'package:ifood/views/content/widgets/header_location_widget.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final ContentController _contentController = ContentController();
  late final List<Category> _listCategories;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _listCategories = _contentController.getCategories();
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBox) {
            return [
              HeaderLocationWidget(
                location: 'Av. Primeiro de Junho, 200',
              ),
              ContentTabBarWidget(
                tabController: _tabController,
                onTap: (index) {},
              ),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return await Future.delayed(Duration(seconds: 1));
                  },
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 86,
                          child: ListView.builder(
                            itemCount: _listCategories.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: index == 0 ? 16.0 : 8.0,
                                  right: index == 19 ? 16.0 : 8.0,
                                ),
                                child: CategoryItemWidget(
                                  category: _listCategories[index],
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ],
                  ),
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
        ),
      ),
    );
  }
}
