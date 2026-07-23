import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/home_dashboard_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;
  bool _rememberMe = true;
  bool _showSuccessDialog = false;

  void _triggerSuccessDialog() {
    setState(() {
      _showSuccessDialog = true;
    });

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeDashboardScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 12,
              right: 24,
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Create New Password',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 110,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Center(
                      child: Image.asset(
                        'assets/images/bg_new_password.png',
                        height: 250,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.lock_reset_rounded,
                              size: 150,
                              color: Color(0xFF1F1D2B),
                            ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Create Your New Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      obscureText: _obscurePassword1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFFAFAFA),
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                          color: Color(0xFF1F1D2B),
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword1
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            color: const Color(0xFF1F1D2B),
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword1 = !_obscurePassword1;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      obscureText: _obscurePassword2,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFFAFAFA),
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                          color: Color(0xFF1F1D2B),
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword2
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            color: const Color(0xFF1F1D2B),
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword2 = !_obscurePassword2;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _rememberMe = !_rememberMe;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: _rememberMe
                                  ? const Color(0xFF1F1D2B)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFF1F1D2B),
                                width: 2,
                              ),
                            ),
                            child: _rememberMe
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F1D2B),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _triggerSuccessDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F1D2B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // 2. OVERLAY LAYER & CARD
            if (_showSuccessDialog) ...[
              Positioned.fill(
                child: Container(
                  color: const Color(0xFF1F1D2B).withOpacity(0.7),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding: const EdgeInsets.fromLTRB(28, 36, 28, 36),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Perisai & Bintik Dekorasi
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 10,
                              left: 20,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1F1D2B),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 25,
                              right: 15,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1F1D2B),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 30,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1F1D2B),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 25,
                              right: 25,
                              child: Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1F1D2B),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1F1D2B),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.shield_outlined,
                                  color: Colors.white,
                                  size: 42,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Judul
                      const Text(
                        'Congratulations!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F1D2B),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Deskripsi
                      const Text(
                        'Your account is ready to use. You will be redirected to the Home page in a few seconds.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF1F1D2B),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 28),

                      const DottedCircularProgressIndicator(
                        color: Color(0xFF1F1D2B),
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class DottedCircularProgressIndicator extends StatefulWidget {
  final Color color;
  final double size;

  const DottedCircularProgressIndicator({
    super.key,
    this.color = const Color(0xFF1F1D2B),
    this.size = 40.0,
  });

  @override
  State<DottedCircularProgressIndicator> createState() =>
      _DottedCircularProgressIndicatorState();
}

class _DottedCircularProgressIndicatorState
    extends State<DottedCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _DottedSpinnerPainter(color: widget.color),
            ),
          ),
        );
      },
    );
  }
}

class _DottedSpinnerPainter extends CustomPainter {
  final Color color;

  _DottedSpinnerPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final int dotCount = 8;
    final double radius = size.width / 2;
    final double center = size.width / 2;

    for (int i = 0; i < dotCount; i++) {
      final double angle = (i * 2 * math.pi) / dotCount;
      final double dotRadius = (size.width * 0.08) * ((i + 1) / dotCount) + 1.5;

      final double x = center + (radius - 6) * math.cos(angle);
      final double y = center + (radius - 6) * math.sin(angle);

      final Paint paint = Paint()
        ..color = color.withOpacity((i + 1) / dotCount)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
