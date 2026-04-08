import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/features/home/presentation/views/home_content_screen.dart';
import 'package:servicely_app1/features/orders/presentation/views/orders_screen.dart';
import 'package:servicely_app1/features/profile/presentation/views/profile_screen.dart';
import 'package:servicely_app1/features/more/presentation/views/more_screen.dart';
import 'package:servicely_app1/core/utils/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavIndex = 0;

  // List of screens for navigation
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeContentScreen(), // الرئيسية
      const OrdersView(), // طلباتى
      const ProfileScreen(), // الملف الشخصى
      const MoreScreen(), // المزيد
    ];
  }

  Widget _buildNavItem(int index, Object iconOrAsset, String label) {
    final selected = selectedNavIndex == index;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => setState(() => selectedNavIndex = index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconOrAsset is IconData
                  ? Icon(
                      iconOrAsset,
                      size: 24,
                      color: selected ? primaryColorHex : secondaryColorHex,
                    )
                  : Image.asset(
                      iconOrAsset as String,
                      width: 24,
                      height: 24,
                    ),
              const SizedBox(height: 2),
              Text(
                label,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 10,
                  color: selected ? primaryColorHex : secondaryColorHex,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      height: 85,
      elevation: 8,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildNavItem(3, Assets.images.menu123287411.path, 'المزيد'),
              _buildNavItem(2, Assets.images.profile.path, 'البروفايل'),
              const SizedBox(width: 64),
              _buildNavItem(1, Assets.images.group.path, 'طلباتى'),
              _buildNavItem(0, Icons.home, 'الرئيسية'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Add button pressed');
        },
        backgroundColor: primaryColorHex, // Button background color
        foregroundColor: Colors.white, // Icon color
        elevation: 6,
        highlightElevation: 12,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.add, size: 28),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      body: IndexedStack(
        index: selectedNavIndex,
        children: _screens,
      ),
    );
  }
}
