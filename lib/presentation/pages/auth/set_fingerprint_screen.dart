import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/home_dashboard_screen.dart';

class SetFingerprintScreen extends StatelessWidget {
  const SetFingerprintScreen({super.key});

  void _showCongratulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const _CongratulationsDialogContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Tombol Kembali & Judul
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Set Your Fingerprint",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 2. Deskripsi
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Add a fingerprint to make your account more secure.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      height: 1.4,
                    ),
                  ),
                ),
              ),
              const Spacer(),

              // 3. Ikon Sidik Jari
              Center(
                child: Image.asset(
                  'assets/images/fingerspint.png', // Pastikan gambar sidik jari ada di folder assets
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(),

              // 4. Instruksi di Bawah Gambar
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Please put your finger on the fingerprint scanner to get started.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1F1D2B),
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // 5. Tombol Skip & Continue
              Row(
                children: [
                  // Tombol Skip
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          _showCongratulationsDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF3F4F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Color(0xFF1F1D2B),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Tombol Continue
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          _showCongratulationsDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F1D2B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget Terpisah untuk Menangani Animasi Putar Buffering secara Mulus
class _CongratulationsDialogContent extends StatefulWidget {
  const _CongratulationsDialogContent();

  @override
  State<_CongratulationsDialogContent> createState() => _CongratulationsDialogContentState();
}

class _CongratulationsDialogContentState extends State<_CongratulationsDialogContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Mengatur kecepatan putar (durasi 1 detik untuk satu putaran penuh)
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(); // Mengulang animasi terus-menerus

    // Timer otomatis menutup dialog dan pindah halaman setelah 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
        // TODO: Ganti dengan navigasi ke halaman Home Anda, contoh:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeDashboardScreen()));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Membersihkan controller saat dialog ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            // Gambar Congratulations
            Image.asset(
              'assets/images/congratulation.png',
              width: 140,
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),

            // Judul
            const Text(
              "Congratulations!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1D2B),
              ),
            ),
            const SizedBox(height: 12),

            // Deskripsi
            const Text(
              "Your account is ready to use. You will be redirected to the Home page in a few seconds..",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF6B7280),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 30),

            // Ikon Buffering yang Berputar Otomatis
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * 3.141592653589793,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/ic_buffering.png',
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}