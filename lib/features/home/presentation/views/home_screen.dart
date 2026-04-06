import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/features/home/presentation/views/home_content_screen.dart';
import 'package:servicely_app1/features/orders/presentation/views/orders_screen.dart';
import 'package:servicely_app1/features/profile/presentation/views/profile_screen.dart';
import 'package:servicely_app1/features/more/presentation/views/more_screen.dart';

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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconOrAsset is IconData
                    ? Icon(
                        iconOrAsset,
                        size: 24,
                        color:
                            selected ? primaryColorHex : Colors.grey.shade600,
                      )
                    : Image.asset(
                        iconOrAsset as String,
                        width: 24,
                        height: 24,
                      ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    color: selected ? primaryColorHex : Colors.grey.shade600,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
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
              _buildNavItem(3, "assets/images/menu_12328741 1.png", 'المزيد'),
              _buildNavItem(2, "assets/images/profile.png", 'الملف الشخصى'),
              const SizedBox(width: 64),
              _buildNavItem(1, "assets/images/Group.png", 'طلباتى'),
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
