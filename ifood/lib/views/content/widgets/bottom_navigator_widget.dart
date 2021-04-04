import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/views/content/widgets/bottom_navigator_item_widget.dart';

class BottomNavigatorWidget extends StatelessWidget {
  final List<BottomNavigatorItemWidget> items;
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigatorWidget({
    Key? key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items
                .map((e) => e.copyWith(
                      isActive: items.indexOf(e) == currentIndex,
                      onTap: () => onTap(items.indexOf(e)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
