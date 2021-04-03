import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_icons.dart';

class BottomNavigatorItemWidget extends StatelessWidget {
  final String label;
  final String icon;
  final String activeIcon;
  final bool isActive;
  final Function? onTap;

  const BottomNavigatorItemWidget({
    Key? key,
    required this.label,
    required this.icon,
    required this.activeIcon,
    this.onTap,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            AppIcon(isActive ? activeIcon : icon),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigatorItemWidget copyWith({
    String? label,
    String? activeIcon,
    String? icon,
    bool? isActive,
    Function? onTap,
  }) {
    return BottomNavigatorItemWidget(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      activeIcon: activeIcon ?? this.activeIcon,
      isActive: isActive ?? this.isActive,
      onTap: onTap ?? this.onTap,
    );
  }
}
