import 'package:flutter/material.dart';

class EmptyOrderState extends StatelessWidget {
  const EmptyOrderState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/EmptyOrder.png', width: 200, height: 200),
          const SizedBox(height: 16),
          const Text(
            'You don\'t have an order yet',
            style: TextStyle(
              fontFamily: 'urbanist',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'You don\'t have an active orders at this time',
            style: TextStyle(
              fontFamily: 'urbanist',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
