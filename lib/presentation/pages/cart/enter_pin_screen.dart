import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/auth/checkout_succes_dialog.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  String _pin =
      "9999"; // Simulasi PIN terisi default sesuai UI gambar (4 digit)

  void _onKeyTap(String value) {
    if (_pin.length < 4) {
      setState(() {
        _pin += value;
      });
    }
  }

  void _onBackspace() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // STATUS BAR MANUAL

            // HEADER (BACK BUTTON, TITLE)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF1F1D2B),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Enter Your PIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter your PIN to confirm payment',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),

                  // 4 INPUT PIN BOXES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      final isFocused =
                          _pin.length == index ||
                          (_pin.length == 4 && index == 3);
                      final hasValue = index < _pin.length;
                      final isLastInputAndFilled =
                          hasValue && index == _pin.length - 1;

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 68,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isFocused
                                ? const Color(0xFF1F1D2B)
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: hasValue
                              ? (isLastInputAndFilled && _pin.length == 4
                                    ? Text(
                                        _pin[index],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF1F1D2B),
                                        ),
                                      )
                                    : Container(
                                        width: 16,
                                        height: 16,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF1F1D2B),
                                          shape: BoxShape.circle,
                                        ),
                                      ))
                              : null,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 40),

                  // CONTINUE BUTTON
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _pin.length == 4
                            ? () {
                                showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // Mencegah popup tertutup jika diklik diluar
                                  builder: (BuildContext context) {
                                    return const CheckoutSuccessDialog();
                                  },
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F1D2B),
                          disabledBackgroundColor: const Color(
                            0xFF1F1D2B,
                          ).withOpacity(0.5),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
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
                  ),
                ],
              ),
            ),

            // NUMERIC KEYPAD
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 12),
              decoration: const BoxDecoration(
                color: Color(0xFFFAFAFA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  _buildKeyboardRow(['1', '2', '3']),
                  _buildKeyboardRow(['4', '5', '6']),
                  _buildKeyboardRow(['7', '8', '9']),
                  _buildKeyboardRow(['*', '0', 'backspace']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: keys.map((key) {
          if (key == 'backspace') {
            return IconButton(
              icon: const Icon(
                Icons.backspace_outlined,
                color: Color(0xFF1F1D2B),
                size: 22,
              ),
              onPressed: _onBackspace,
            );
          }
          return InkWell(
            onTap: () => _onKeyTap(key),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 60,
              height: 40,
              alignment: Alignment.center,
              child: Text(
                key,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1D2B),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
