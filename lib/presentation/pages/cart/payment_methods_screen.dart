import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/cart/enter_pin_screen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  int _selectedPaymentIndex = 0;

  // 1. Menggunakan path asset gambar untuk tiap provider
  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'title': 'My Wallet',
      'balance': '\$9,379',
      'iconPath': 'assets/icons/wallet.png',
    },
    {'title': 'PayPal', 'balance': null, 'iconPath': 'assets/icons/Paypal.png'},
    {
      'title': 'Google Pay',
      'balance': null,
      'iconPath': 'assets/icons/Google.png',
    },
    {
      'title': 'Apple Pay',
      'balance': null,
      'iconPath': 'assets/icons/Apple.png',
    },
    {
      'title': '•••• •••• •••• 4679',
      'balance': null,
      'iconPath': 'assets/icons/mastercard.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // STATUS BAR

            // HEADER
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
                  const Expanded(
                    child: Text(
                      'Payment Methods',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                      color: Color(0xFF1F1D2B),
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // SUBTITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select the payment method you want to use.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // PAYMENT LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: _paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = _paymentMethods[index];
                  final isSelected = _selectedPaymentIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPaymentIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? Colors.black.withOpacity(0.08)
                                : Colors.black.withOpacity(0.03),
                            blurRadius: isSelected ? 15 : 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // 2. TAMPILAN IMAGE LOGO
                          SizedBox(
                            width: 32,
                            height: 32,
                            child: Image.asset(
                              method['iconPath'] as String,
                              fit: BoxFit.contain,
                              // Fallback / penanganan jika gambar gagal dipanggil:
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.payment_rounded,
                                    color: Color(0xFF1F1D2B),
                                  ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // TITLE
                          Expanded(
                            child: Text(
                              method['title'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F1D2B),
                              ),
                            ),
                          ),

                          // BALANCE
                          if (method['balance'] != null) ...[
                            Text(
                              method['balance'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F1D2B),
                              ),
                            ),
                            const SizedBox(width: 12),
                          ],

                          // CUSTOM RADIO SELECTION
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF1F1D2B),
                                width: 2,
                              ),
                            ),
                            padding: const EdgeInsets.all(3),
                            child: isSelected
                                ? Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF1F1D2B),
                                    ),
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // BUTTON CONFIRM
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnterPinScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F1D2B),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Confirm Payment',
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
    );
  }
}
