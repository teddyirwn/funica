import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/auth/light_lets_you_in.dart';

class WalkthroughThreeV2 extends StatelessWidget {
  const WalkthroughThreeV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              // 1. Status Bar Palsu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.signal_cellular_alt, size: 18, color: Colors.black),
                      const SizedBox(width: 5),
                      const Icon(Icons.wifi, size: 18, color: Colors.black),
                      const SizedBox(width: 5),
                      const Icon(Icons.battery_full, size: 18, color: Colors.black),
                    ],
                  ),
                ],
              ),
              const Spacer(),

              // 2. Gambar Ilustrasi Utama
              Image.asset(
                'assets/bg_screen10.png',
                height: 320,
                fit: BoxFit.contain,
              ),
              const Spacer(),

              // 3. Teks Judul
              const Text(
                "Let's fulfill your\nhouse needs with\nFunica right now!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1D2B),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 30),

              // 4. Indikator Dots (Halaman 3 Aktif)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 18,
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1D2B),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // 5. Tombol Get Started (Navigasi ke Screen 11)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LetsYouInScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F1D2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}