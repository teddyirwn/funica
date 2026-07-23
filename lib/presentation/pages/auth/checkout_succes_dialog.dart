import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/home_dashboard_screen.dart';
import 'package:funica/presentation/pages/order/order_page.dart';
import 'package:funica/presentation/widget/e_receipt/menu_pop_up.dart';
import 'package:funica/presentation/widget/e_receipt/receipt_popup_menu.dart';

class CheckoutSuccessDialog extends StatelessWidget {
  const CheckoutSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 8,
                        left: 16,
                        child: _buildDot(16),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: _buildDot(12),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 40,
                        child: _buildDot(8),
                      ),
                      Positioned(
                        right: 12,
                        bottom: 30,
                        child: _buildDot(6),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 50,
                        child: _buildDot(6),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1F1D2B),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // JUDUL & SUBTITLE
            const Text(
              'Order Successful!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1D2B),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You have successfully made order',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 28),

            // TOMBOL VIEW ORDER
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OrderPage()),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F1D2B),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Text(
                  'View Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // TOMBOL 2: VIEW E-RECEIPT (ABU-ABU MUDA)
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReceiptPopupMenu(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEBEBEB),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Text(
                  'View E-Receipt',
                  style: TextStyle(
                    color: Color(0xFF1F1D2B),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFF1F1D2B),
        shape: BoxShape.circle,
      ),
    );
  }
}