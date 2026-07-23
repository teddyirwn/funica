import 'package:flutter/material.dart';
import 'set_fingerprint_screen.dart';

class CreateNewPinScreen extends StatefulWidget {
  const CreateNewPinScreen({super.key});

  @override
  State<CreateNewPinScreen> createState() => _CreateNewPinScreenState();
}

class _CreateNewPinScreenState extends State<CreateNewPinScreen> {
  final List<String> _pin = [];

  void _onKeyPressed(String value) {
    setState(() {
      if (value == 'del') {
        if (_pin.isNotEmpty) {
          _pin.removeLast();
        }
      } else {
        if (_pin.length < 4) {
          _pin.add(value);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Judul
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Create New PIN",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Deskripsi
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Add a PIN number to make your account more secure.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Kotak Input PIN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  bool hasDigit = index < _pin.length;
                  bool isLatestDigit = index == _pin.length - 1;

                  return Container(
                    width: 64,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: hasDigit ? const Color(0xFF1F1D2B) : const Color(0xFFEFEFEF),
                        width: hasDigit ? 1.5 : 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: hasDigit
                        ? (isLatestDigit
                        ? Text(
                      _pin[index],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1D2B),
                      ),
                    )
                        : Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1F1D2B),
                        shape: BoxShape.circle,
                      ),
                    ))
                        : null,
                  );
                }),
              ),
            ),
            const Spacer(),

            // Tombol Continue
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _pin.length == 4
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SetFingerprintScreen(),
                      ),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F1D2B),
                    disabledBackgroundColor: const Color(0xFFEFEFEF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: _pin.length == 4 ? Colors.white : const Color(0xFF9E9E9E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Keypad Angka
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  _buildKeypadRow(['1', '2', '3']),
                  const SizedBox(height: 16),
                  _buildKeypadRow(['4', '5', '6']),
                  const SizedBox(height: 16),
                  _buildKeypadRow(['7', '8', '9']),
                  const SizedBox(height: 16),
                  _buildKeypadRow(['*', '0', 'del']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypadRow(List<String> values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: values.map((val) {
        return InkWell(
          onTap: () {
            if (val != '*') {
              _onKeyPressed(val);
            }
          },
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 70,
            height: 45,
            alignment: Alignment.center,
            child: val == 'del'
                ? const Icon(Icons.backspace_outlined, color: Color(0xFF1F1D2B), size: 22)
                : Text(
              val,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F1D2B),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}