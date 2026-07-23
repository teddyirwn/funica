import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/auth/create_new_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<String> _otpCodes = ['', '', '', ''];
  int _focusedIndex = 0;
  int _secondsRemaining = 55;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void _onKeyPairPressed(String value) {
    if (_focusedIndex < 4) {
      setState(() {
        _otpCodes[_focusedIndex] = value;
        if (_focusedIndex < 3) {
          _focusedIndex++;
        } else {

          FocusScope.of(context).unfocus();
        }
      });
    }
  }

  void _onBackspacePressed() {
    setState(() {
      if (_otpCodes[_focusedIndex].isNotEmpty) {
        _otpCodes[_focusedIndex] = '';
      } else if (_focusedIndex > 0) {
        _focusedIndex--;
        _otpCodes[_focusedIndex] = '';
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(
          children: [
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
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.signal_cellular_alt, size: 18, color: Colors.black),
                          const SizedBox(width: 5),
                          const Icon(Icons.wifi, size: 18, color: Colors.black),
                          const SizedBox(width: 5),
                          Transform.rotate(
                            angle: math.pi / 2,
                            child: const Icon(Icons.battery_full, size: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                      'Forgot Password',
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
              top: 120,
              bottom: 280,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Code has been send to +1 111 ******99',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        final isFocused = index == _focusedIndex;
                        return Container(
                          width: 68,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isFocused
                                  ? const Color(0xFF1F1D2B)
                                  : const Color(0xFFF3F3F3),
                              width: isFocused ? 2 : 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _otpCodes[index],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F1D2B),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      _secondsRemaining > 0
                          ? 'Resend code in $_secondsRemaining s'
                          : 'Resend code',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF1F1D2B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen()),
                        );
                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF35383F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 280,
              child: Container(
                color: const Color(0xFFFAFAFA),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ['1', '2', '3'].map((val) => _buildKey(val)).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ['4', '5', '6'].map((val) => _buildKey(val)).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ['7', '8', '9'].map((val) => _buildKey(val)).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildKey('*'),
                        _buildKey('0'),
                        Expanded(
                          child: InkWell(
                            onTap: _onBackspacePressed,
                            child: const SizedBox(
                              height: 50,
                              child: Icon(Icons.backspace_outlined, color: Color(0xFF1F1D2B), size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKey(String value) {
    return Expanded(
      child: InkWell(
        onTap: () => _onKeyPairPressed(value),
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F1D2B),
              ),
            ),
          ),
        ),
      ),
    );
  }
}