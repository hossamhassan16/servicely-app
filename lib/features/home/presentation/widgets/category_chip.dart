import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';

class CategoriesTabBar extends StatelessWidget {
  final List<String> categories;
  final ValueChanged<int>? onTap;

  const CategoriesTabBar({
    super.key,
    required this.categories,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorColor: primaryColorHex,
      indicatorWeight: 3,
      labelColor: primaryColorHex,
      unselectedLabelColor: Colors.black,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
      onTap: onTap,
      tabs: categories.map((category) {
        return Tab(
          text: category,
        );
      }).toList(),
    );
  }
}
