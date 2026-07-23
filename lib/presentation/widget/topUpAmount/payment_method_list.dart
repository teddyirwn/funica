import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodList extends StatefulWidget {
  const PaymentMethodList({super.key});

  @override
  State<PaymentMethodList> createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  int selectedIndex = 3;

  final methods = [
    {"name": "PayPal", "image": "assets/icons/paypal.svg"},
    {"name": "Google Pay", "image": "assets/icons/google.svg"},
    {"name": "Apple Pay", "image": "assets/icons/apple.svg"},
    {"name": "•••• •••• •••• 4679", "image": "assets/icons/mastercard.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(methods.length, (index) {
        final item = methods[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                SvgPicture.asset(item["image"]!, width: 24, height: 24),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    item["name"]!,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Radio<int>(
                  value: index,
                  groupValue: selectedIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedIndex = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
