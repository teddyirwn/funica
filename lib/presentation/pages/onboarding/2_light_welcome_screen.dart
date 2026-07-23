import 'dart:math' as math;
import 'package:flutter/material.dart';
import '3_light_walkthrough_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WalkthroughScreenTwo(),
            ),
          );
        },
        child: SizedBox.expand(
          child: Stack(
            children: [
              // 1. Background Gambar Lampu
              Positioned.fill(
                child: Image.asset(
                  'assets/images/bg_welcome.png',
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                bottom: 40,
                left: 24,
                right: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome to ',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.waving_hand_rounded,
                          size: 38,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Funica',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'The best furniture e-commerce app of the century for your daily needs!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
