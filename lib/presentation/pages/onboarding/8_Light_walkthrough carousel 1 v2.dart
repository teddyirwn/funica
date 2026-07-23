import 'package:flutter/material.dart';
import '9_Light_walkthrough carousel 2 v2.dart';

class WalkthroughOneV2 extends StatelessWidget {
  const WalkthroughOneV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              // 1. Status Bar
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
                'assets/bg_screen8.png',
                height: 320,
                fit: BoxFit.contain,
              ),
              const Spacer(),

              // 3. Teks Judul
              const Text(
                'We provide high\nquality products just\nfor you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1D2B),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 30),

              // 4. Indikator Dots (Halaman 1 Aktif)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1D2B),
                      borderRadius: BorderRadius.circular(3),
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
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // 5. Tombol Next
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WalkthroughTwoV2()),
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
                    'Next',
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