import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/onboarding/2_light_welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo_funica.png',
                width: 190,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 110,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'assets/images/ic_buffering.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
