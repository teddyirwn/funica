import 'dart:math' as math;
import 'package:flutter/material.dart';
import '7_light_welcome_screen.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    // Berpindah otomatis ke Screen 7 setelah 3 detik
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
      backgroundColor: const Color(0xFF1F1D2B), // Latar belakang gelap sesuai referensi Screen 6
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Status Bar (Diubah jadi warna putih agar terlihat di background gelap)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '9:41',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.signal_cellular_alt, size: 18, color: Colors.white),
                          const SizedBox(width: 5),
                          const Icon(Icons.wifi, size: 18, color: Colors.white),
                          const SizedBox(width: 5),
                          Transform.rotate(
                            angle: math.pi / 2,
                            child: const Icon(Icons.battery_full, size: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Logo Funica di Tengah
            Center(
              child: Image.asset(
                'assets/logo_funica.png',
                width: 190,
                fit: BoxFit.contain,
              ),
            ),

            // Indikator Buffering Berputar di Bawah
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
                    'assets/ic_buffering.png',
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