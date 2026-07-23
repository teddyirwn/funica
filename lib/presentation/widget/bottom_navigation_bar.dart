import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/cart/my_cart_screen.dart';
import 'package:funica/presentation/pages/eWallet/eWallet_page.dart';
import 'package:funica/presentation/pages/home_dashboard_screen.dart';
import 'package:funica/presentation/pages/order/order_page.dart';
import 'package:funica/presentation/pages/profile/profile_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavigationBar({super.key, required this.selectedIndex});

  void _handleNavigation(BuildContext context, int index) {
    if (index == selectedIndex) return;

    late Widget targetPage;

    switch (index) {
      case 0:
        targetPage = const HomeDashboardScreen();
        break;

      case 1:
        targetPage = const MyCartScreen();
        break;

      case 2:
        targetPage = const OrderPage();
        break;

      case 3:
        targetPage = const EwalletPage();
        break;

      case 4:
        targetPage = const ProfilePage();
        break;

      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => targetPage,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, 0, Icons.home_rounded, 'Home'),
              _buildNavItem(context, 1, Icons.shopping_bag_outlined, 'Cart'),
              _buildNavItem(context, 2, Icons.shopping_cart_outlined, 'Orders'),
              _buildNavItem(
                context,
                3,
                Icons.account_balance_wallet_outlined,
                'Wallet',
              ),
              _buildNavItem(
                context,
                4,
                Icons.person_outline_rounded,
                'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
  ) {
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => _handleNavigation(context, index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? const Color(0xFF1F1D2B) : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFF1F1D2B) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
