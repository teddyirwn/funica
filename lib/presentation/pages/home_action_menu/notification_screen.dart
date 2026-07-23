import 'dart:math' as math;
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // STATUS BAR MANUAL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.signal_cellular_alt, size: 18, color: Colors.black),
                      const SizedBox(width: 5),
                      const Icon(Icons.wifi, size: 18, color: Colors.black),
                      const SizedBox(width: 5),
                      Transform.rotate(
                        angle: math.pi / 2,
                        child: const Icon(Icons.battery_full, size: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // HEADER (Tombol Back, Judul, & Option Icon)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF1F1D2B)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 4),
                  const Expanded(
                    child: Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz_rounded, color: Color(0xFF1F1D2B)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // LIST NOTIFIKASI
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                children: [
                  // SECTION: TODAY
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildNotificationItem(
                    icon: Icons.percent_rounded,
                    title: '30% Special Discount!',
                    subtitle: 'Special promotion only valid today',
                  ),
                  const SizedBox(height: 24),

                  // SECTION: YESTERDAY
                  const Text(
                    'Yesterday',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildNotificationItem(
                    icon: Icons.account_balance_wallet_rounded,
                    title: 'Top Up E-Wallet Successful!',
                    subtitle: 'You have to top up your e-wallet',
                  ),
                  const SizedBox(height: 16),
                  _buildNotificationItem(
                    icon: Icons.location_on_rounded,
                    title: 'New Services Available!',
                    subtitle: 'Now you can track orders in real time',
                  ),
                  const SizedBox(height: 24),

                  // SECTION: DECEMBER 22, 2024
                  const Text(
                    'December 22, 2024',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildNotificationItem(
                    icon: Icons.credit_card_rounded,
                    title: 'Credit Card Connected!',
                    subtitle: 'Credit Card has been linked!',
                  ),
                  const SizedBox(height: 16),
                  _buildNotificationItem(
                    icon: Icons.person_rounded,
                    title: 'Account Setup Successful!',
                    subtitle: 'Your account has been created!',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET CARD NOTIFIKASI
  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: Color(0xFF1F1D2B),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F1D2B),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}