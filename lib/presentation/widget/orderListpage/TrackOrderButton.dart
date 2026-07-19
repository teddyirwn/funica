import 'package:flutter/material.dart';
import 'package:funica/core/constants/app_color.dart';
import 'package:funica/presentation/pages/order_tracking_page.dart';

class TrackOrderButton extends StatelessWidget {
  final Map<String, dynamic> order;
  const TrackOrderButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderTrackingPage(order: order),
            ),
          );
        },
        child: Text(
          order['buttonTxt'] ?? 'Track Order',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
