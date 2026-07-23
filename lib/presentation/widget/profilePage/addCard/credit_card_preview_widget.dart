import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreditCardPreviewWidget extends StatelessWidget {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;

  const CreditCardPreviewWidget({
    super.key,
    this.cardHolderName = 'Andrew Ainsley',
    this.cardNumber = '•••• •••• •••• 4679',
    this.expiryDate = '09/25',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 240,
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Transform.scale(
              scale: 1.3,
              child: Image.asset('assets/images/card.png', fit: BoxFit.cover),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mocard",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/amazon.svg",
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),

                Text(
                  "•••• •••• •••• ••••",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Card Holder name",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          "•••• ••••",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiry date",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          "••••/••••",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),

                    SvgPicture.asset(
                      "assets/icons/mastercard.svg",
                      width: 40,
                      height: 40,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
